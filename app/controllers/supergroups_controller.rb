class SupergroupsController < ApplicationController
  
  before_action :set_klass
  before_action :set_supergroup, only: [:show, :edit, :update, :destroy, :follow]

  include SupergroupsHelper
  
  # GET /supergroups
  # GET /supergroups.json
  def index
    @supergroups = @klass.filter(params.slice(:name_like))
    respond_to do |format|
      format.html
      format.json { render json: @supergroups }
    end
  end

  # GET /supergroups/1
  # GET /supergroups/1.json
  def show
    @post = Post.new(parent: @supergroup)
    @recs = Rec.where(["#{@klass}_id=?", @supergroup.id])
  end

  # GET /supergroups/new
  def new
    @supergroup = @klass.new
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
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supergroup_params
      params[supergroup]['type'] = @klass.name
      params.require(supergroup).permit(:name, :type, :www, :banner, :logo, :short_name, :call_to_action, :explanation, :submissions_heading, :background_colour, :font_colour, :action1)
    end
end
