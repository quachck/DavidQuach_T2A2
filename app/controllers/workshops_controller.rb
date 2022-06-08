class WorkshopsController < ApplicationController
  before_action :eager_load
  before_action :set_workshop, only: %i[ show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :check_auth, except: %i[new index create show instructor]

  def instructor
    # select workshops that belong to the curent user
    @workshops = Workshop.where(user: current_user)
  end

  # GET /workshops or /workshops.json
  def index
    # select all workshops
    @workshops = Workshop.all.order(created_at: :desc)
  end
  
  def show
    # select timeslots that belong to the current workshop
    @timeslots = Timeslot.where("workshop_id = ?", @workshop.id).order(day: :asc)
  end

  # GET /workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /workshops/1/edit
  def edit
  end

  # POST /workshops or /workshops.json
  def create
    @workshop = Workshop.new(workshop_params)
    @workshop.user_id = current_user.id
    authorize(@workshop)

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to new_workshop_timeslot_path(@workshop.id), notice: "Workshop was successfully created." }
        format.json { render :new }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workshops/1 or /workshops/1.json
  def update
    respond_to do |format|
      if @workshop.update(workshop_params)
        format.html { redirect_to workshop_url(@workshop), notice: "Workshop was successfully updated." }
        format.json { render :show, status: :ok, location: @workshop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshops/1 or /workshops/1.json
  def destroy
    @workshop.destroy

    respond_to do |format|
      format.html { redirect_to workshops_url, notice: "#{@workshop.title} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop
      @workshop = Workshop.includes(:user, :timeslots)
      @workshop = Workshop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workshop_params
      params.require(:workshop).permit(:user_id, :title, :price, :description, :category, :skill_level, :location, :img)
    end

    def check_auth
      authorize(@workshop)
    end

    #eager load associations 
    def eager_load
      @timeslots = Timeslot.includes(:workshop)
      @workshops = Workshop.includes(:user)
    end
end
