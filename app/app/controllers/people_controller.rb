class PeopleController < ApplicationController
  before_action :set_person, only: [:edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.filter(params.slice(:name_like))
    @invited = @people.invited.order(:last_name, :first_name).eager_load(:union)
    @not_invited = @people.not_invited.order(:last_name, :first_name).eager_load(:union)

    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
    @recs = @person.recs
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    #TODO Temp until invite system is going, and this action is removed
    
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person.union, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person.union, notice: 'Profile successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :title, :address, :mobile, :fax, :email, :attachment, :union_id)
    end
end
