class RecsController < ApplicationController
  before_action :authenticate_person!, except: [:index, :new, :create]
  before_action :set_rec, only: [:show, :edit, :update, :destroy, :follow]
  include RecsHelper

  # GET /recs
  # GET /recs.json
  def index
    @recs = Rec.all
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
  end

  # GET /recs/1/edit
  def edit
  end

  # POST /recs
  # POST /recs.json
  def create
    @rec = Rec.new(rec_params)
    
    respond_to do |format|
      if @rec.save
        format.html { redirect_to recs_url, notice: 'The submission was successfully created.' }
        format.json { render :show, status: :created, location: @rec }
      else
        format.html { render :new }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def rec_params
      if params[:rec] && params[:rec][:person_attributes] && params[:rec][:person_attributes][:union_id].nil?
        # hack to save emma's first submision
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
          person_attributes: [
            :first_name, 
            :last_name, 
            :email, 
            :mobile,
            :attachment, 
            :title, 
            :address,
            :union_id,
            :id
          ]
        ]
      )
      result
    end
end
