class SupergroupsController < ApplicationController
  before_action :authenticate_person!, except: [:show, :all]
  skip_before_action :authenticate_person!, if: :ok_to_skip_authentication
  before_action :set_klass
  before_action :set_supergroup, only: [:show, :edit, :update, :destroy, :follow, :all]
  
  include SupergroupsHelper
  
  # GET /supergroups
  # GET /supergroups.json
  def index
    @supergroups = @klass.filter(params.slice(:name_like)).order(:short_name)
    respond_to do |format|
      format.html
      format.json { render json: @supergroups }
    end
  end

  # GET /supergroups/1
  # GET /supergroups/1.json
  def show
    not_found if params[:format] == 'xls' && (current_person.blank? || !can_edit_union(@supergroup))
    not_found unless @supergroup.enabled || current_person
    @post = Post.new(parent: @supergroup)
    @recs = Rec.eager_load(:union).eager_load(:person).where(["recs.#{@klass}_id=? or people.#{@klass}_id=?", @supergroup.id, @supergroup.id])
    @recs = @recs.where(enabled: true) unless current_person
    @recs = @recs.order(created_at: :desc)
    
    return render 'embed', layout: 'embed' if params[:embed]
    respond_to do |format|
      format.html
      format.xls { render 'shared/export.xls' }
    end
  end

  def all
    @recs = Rec.all.eager_load(:person).eager_load(:union)
    @recs = @recs.where(enabled: true) unless current_person
    @recs = @recs.order(created_at: :desc)
  end

  # GET /supergroups/new
  def new
    @supergroup = @klass.new
    @supergroup.set_defaults_from_owner
  end

  # GET /supergroups/1/edit
  def edit
  end

  # POST /supergroups
  # POST /supergroups.json
  def create
    @supergroup = @klass.new(supergroup_params)

    respond_to do |format|
      if @supergroup.save
        format.html { redirect_to @supergroup, notice: "#{supergroup.titlecase} was successfully created." }
        format.json { render :show, status: :created, location: @supergroup }
      else
        format.html { render :new }
        format.json { render json: @supergroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supergroups/1
  # PATCH/PUT /supergroups/1.json
  def update
    respond_to do |format|
      if @supergroup.update(supergroup_params)
        format.html { redirect_to @supergroup, notice: "#{supergroup.titlecase} was successfully updated." }
        format.json { render :show, status: :ok, location: @supergroup }
      else
        format.html { render :edit }
        format.json { render json: @supergroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supergroups/1
  # DELETE /supergroups/1.json
  def destroy
    @supergroup.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_url(supergroups), notice: "#{supergroup.titlecase} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def follow
    current_person.toggle_follow!(@supergroup)
    redirect_to @supergroup
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_klass
      @klass = params[:type].blank? ? Supergroup : params[:type].constantize
    end

    def set_supergroup
      if (Integer(params[:id]) rescue nil)
        @supergroup = @klass.find(params[:id])
      else
        @supergroup = @klass.where("short_name ilike ?", params[:id].downcase).first
      end
      not_found if @supergroup.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supergroup_params
      params[supergroup]['type'] = @klass.name
      params.require(supergroup).permit(:name, :type, :www, :banner, :logo, :short_name, :call_to_action, :explanation, :submissions_heading, :background_colour, :font_colour, :action1, :enabled, :union_rep, :union_rep_quote, :union_rep_cite, :hashtags, :facebook_image, :tweet)
    end

    def ok_to_skip_authentication
      (action_name=='index'  && (request.format.json?)) 
    end
end


