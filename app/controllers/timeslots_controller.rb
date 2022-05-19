class TimeslotsController < ApplicationController
  before_action :set_timeslot, only: %i[ show edit update destroy ]
  before_action :set_workshop, only: %i[ index new create ]
  before_action :authenticate_user!, except: %i[index show]

  # GET /timeslots or /timeslots.json
  def index
    @timeslots = Timeslot.all.filter { |e| e.workshop.id == @workshop.id }
  end

  # GET /timeslots/1 or /timeslots/1.json
  def show
  end

  # GET /timeslots/new
  def new
    authorize(@workshop)
    @timeslot = Timeslot.new
  end

  # GET /timeslots/1/edit
  def edit
    authorize(@timeslot)
  end

  # POST /timeslots or /timeslots.json
  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.workshop_id = @workshop.id
    @timeslot.available_tickets = @timeslot.total_tickets


    respond_to do |format|
      if @timeslot.save && params[:save_end]
        # save to temporary spot for now, i want to redirect this to a page with all the workshops and attached timeslots
        format.html { redirect_to timeslot_path(@timeslot.id), notice: "Timeslot was successfully created" }
        format.json { render :show, status: :created, location: @timeslot }
      elsif @timeslot.save && params[:save_continue]
        # sent to a new timeslot page
        format.html { redirect_to new_workshop_timeslot_path(@workshop.id), notice: "Timeslot was successfully created. You can add another one" }
        format.json { render :show, status: :created, location: @timeslot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @timeslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeslots/1 or /timeslots/1.json
  def update
    respond_to do |format|
      if @timeslot.update(timeslot_params)
        format.html { redirect_to timeslot_url(@timeslot), notice: "Timeslot was successfully updated." }
        format.json { render :show, status: :ok, location: @timeslot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @timeslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeslots/1 or /timeslots/1.json
  def destroy
    
    respond_to do |format|
      format.html { redirect_to workshop_path(@timeslot.workshop.id), notice: "Timeslot was successfully destroyed." }
      format.json { render :no_content }
    end
    @timeslot.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeslot
      @timeslot = Timeslot.find(params[:id])
    end

    def set_workshop
      @workshop = Workshop.find(params[:workshop_id])
    end

    # Only allow a list of trusted parameters through.
    def timeslot_params
      params.require(:timeslot).permit(:workshop_id, :day, :start_time, :end_time, :price, :total_tickets, :available_tickets)
    end
end
