class RecsController < ApplicationController
  before_action :authenticate_person!, except: [:index, :new, :create, :review, :video_upload]
  before_action :set_rec, only: [:show, :edit, :update, :destroy, :follow]
  before_action :set_rec_from_token, only: [:review, :video_upload]

  include RecsHelper

  # GET /recs
  # GET /recs.json
  def index
    @recs = Rec.all
    @supergroup = @union # TODO is there a better way?
    return render 'embed', layout: false if params[:embed]
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
    return render 'embed_new', layout: false if params[:embed]
  end

  # GET /recs/1/edit
  def edit
  end

  # After posting a submission
  def review
      return render 'embed_review', layout: false if params[:embed]
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
    
    respond_to do |format|
      if @rec.save
        # let unauthenticated users review with a temporary url
        success_url = current_person ? rec_url(@rec.id)  : secured_review_rec_url
        success_url = secured_embed_review_rec_url

        format.html { redirect_to success_url, notice: 'The submission was successfully created.' }
        format.json { render :show, status: :created, location: @rec }
      else
        if params[:embed]
          result = render 'embed_new', layout: false 
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rec
      @rec = Rec.find(params[:id])
    end

    # allow a user to review their submission after posting, without letting them guess at other URLs and review things they should
    def secured_review_rec_url
      token = SecureRandom.hex(4) # the token is only to keep the urls restful and to allow migration to a persisted token in future 
      session[token] = rec.id
      review_rec_url(token)
    end
  
    # allow a user to review their submission after posting, without letting them guess at other URLs and review things they should
    def secured_embed_review_rec_url
      @token = SecureRandom.hex(4) # the token is only to keep the urls restful and to allow migration to a persisted token in future 
      session[@token] = @rec.id
      "/embed/#{@union.id}/review/#{@token}"
    end

    def set_rec_from_token
      @token = params[:id]
      @rec = Rec.find(session[@token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rec_params
      if params[:rec] && params[:rec][:person_attributes] && params[:rec][:person_attributes][:union_id].nil?
        # hack to save emma's first submision and workaround union_id bug
        params[:rec][:person_attributes][:union_id] = params[:rec][:union_id]
      end

      result = params.require(:rec).permit(
        [
          :nature_of_employment,
          :when,
          :formally_employed,
          :formally_employed_comment,
          :paid_fairly,
          :paid_fairly_comment,
          :compliant_employment,
          :compliant_employment_comment,
          :could_speak_up,
          :could_speak_up_comment,
          :secure_stay,
          :secure_stay_comment,
          :safe_work,
          :safe_work_comment,
          :predictable_hours,
          :predictable_hours_comment,
          :family_life,
          :family_life_comment,
          :primary_carer,
          :primary_carer_comment,
          :entitlements,
          :entitlements_comment,
          :financially_stable,
          :financially_stable_comment,
          :accommodation_secure,
          :accommodation_secure_comment,
          :community_life,
          :community_life_comment,
          :prefer_flexibility,
          :prefer_flexibility_comment,
          :is_union,
          :host_employer,
          :company,
          :location,
          :industry,
          :supermarket_supply,
          :advertised,
          :solution,
          :summary,
          :is_anonymous,
          :union_id,
          :company_name,
          :attachment,
          person_attributes: [
            :first_name, 
            :last_name, 
            :email, 
            :mobile,
            :attachment, 
            :title, 
            :union_id,
            :id
          ]
        ]
      )
      result
    end
end
