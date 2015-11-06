class RecsController < ApplicationController
  before_action :authenticate_person!, except: [:index, :new, :create, :review, :video_upload]
  before_action :set_rec, only: [:show, :edit, :update, :destroy, :follow, :toggle]
  before_action :set_rec_from_token, only: [:review, :video_upload]

  include RecsHelper

  # GET /recs
  # GET /recs.json
  def index
    @recs = Rec.all.eager_load(:person)
    @recs = @recs.where(enabled: true) unless current_person
    @supergroup = @union # TODO is there a better way?
  end

  # GET /recs/1
  # GET /recs/1.json
  def show
    @post = Post.new(parent: @rec)
  end

  # GET /recs/new
  def new
    @rec = Rec.new
    @rec.person = Person.new
    @rec.person.union = @union
    @rec.union = @union
    return render 'embed_new', layout: 'embed' if params[:embed]
  end

  # GET /recs/1/edit
  def edit
  end

  # After posting a submission
  def review
      return render 'embed_review', layout: 'embed' if params[:embed]
  end

  def video_upload
    respond_to do |format|
      if @rec.update(rec_params)
        format.json { render json: { url: @rec.attachment.url, content_type: @rec.attachment.content_type} }
      else
        format.json { render json: @rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /recs
  # POST /recs.json
  def create
    @rec = Rec.new(rec_params)
    
    # TODO fix this horrible mess
    respond_to do |format|
      if @rec.save
        notify
        thank
        
        # let unauthenticated users review with a temporary url
        success_url = current_person ? rec_url(@rec.id)  : secured_review_rec_url
        success_url = secured_embed_review_rec_url if params[:embed] == "true"

        format.html { redirect_to success_url, notice: 'The submission was successfully created.' }
        format.json { render :show, status: :created, location: @rec }
      else
        if params[:embed] == "true"
          result = render 'embed_new', layout: 'embed' 
        else
          result = render :new
        end if 
        format.html { result }
        format.json { render json: @rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recs/1
  # PATCH/PUT /recs/1.json
  def update
    respond_to do |format|
      if @rec.update(rec_params)
        format.html { redirect_to @rec, notice: 'The submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @rec }
      else
        format.html { render :edit }
        format.json { render json: @rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recs/1
  # DELETE /recs/1.json
  def destroy
    @rec.destroy
    respond_to do |format|
      format.html { redirect_to recs_url, notice: 'The submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follow
    current_person.toggle_follow!(@rec)
    redirect_to @rec
  end

  def toggle
    @rec.update(enabled: !@rec.enabled)
    redirect_to @rec
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rec
      @rec = Rec.find(params[:id])
    end

    def notify
      @rec.union.followers(Person).each do |p|
        if p.invitation_accepted_at
          can_edit = can_edit_union(@rec.union)
          PersonMailer.rec_notice(p, @rec, request, can_edit).deliver_now
        end 
      end
    end

    def thank
      PersonMailer.thanks(@rec.person, @rec, request).deliver_now
    end

    # allow a user to review their submission after posting, without letting them guess at other URLs and review things they should
    def secured_review_rec_url
      review_rec_url(@rec.token)
    end
  
    # allow a user to review their submission after posting, without letting them guess at other URLs and review things they should
    def secured_embed_review_rec_url
      "/embed/#{@union.id}/review/#{@rec.token}"
    end

    def set_rec_from_token
      @rec = Rec.find_by_token(params[:id])
      @rec = Rec.find(params[:id]) if @rec.nil? && current_person # only allow id if logged in (for video_upload from show)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rec_params
      #if params[:rec] && params[:rec][:person_attributes] && params[:rec][:person_attributes][:union_id].nil?
        # hack to save emma's first submision and workaround union_id bug
      #  params[:rec][:person_attributes][:union_id] = params[:rec][:union_id]
      #end
      result = params.require(:rec).permit(
        [
          :nature_of_employment,
          :when,
          :youtube, 
          :paid_fairly,
          :compliant_employment,
          :could_speak_up,
          :pay_and_conditions_comment,
          :safe_work,
          :safe_work_explained, 
          :hsr_explained,
          :health_and_safety_comment,
          :predictable_hours,
          :primary_carer,
          :entitlements,
          :community_life,
          :personal_impact_comment,
          :financially_stable,
          :accommodation_secure,
          :feeling_secure, 
          :financial_security_comment,
          :options,
          :feeling_trapped_comment,
          :is_union,
          :host_employer,
          :company,
          :company_name,
          :location,
          :industry,
          :supermarket_supply,
          :solution,
          :summary,
          :is_anonymous,
          :union_id,
          :attachment,
          person_attributes: [
            :first_name, 
            :last_name, 
            :gender, 
            :email, 
            :mobile,
            :attachment, 
            :title, 
            :union_id,
            :volunteer,
            :id
          ]
        ]
      )
      result
    end
end
