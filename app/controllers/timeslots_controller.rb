class TimeslotsController < ApplicationController
  before_action :set_timeslot, only: %i[ show edit update destroy ]

  # GET /timeslots or /timeslots.json
  def index
    @timeslots = Timeslot.all
  end

  # GET /timeslots/1 or /timeslots/1.json
  def show
  end

  # GET /timeslots/new
  def new
    @timeslot = Timeslot.new
  end

  # GET /timeslots/1/edit
  def edit
  end

  # POST /timeslots or /timeslots.json
  def create
    @timeslot = Timeslot.new(timeslot_params)

    respond_to do |format|
      if @timeslot.save
        format.html { redirect_to timeslot_url(@timeslot), notice: "Timeslot was successfully created." }
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
    @timeslot.destroy

    respond_to do |format|
      format.html { redirect_to timeslots_url, notice: "Timeslot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeslot
      @timeslot = Timeslot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timeslot_params
      params.require(:timeslot).permit(:workshop_id, :day, :start_time, :end_time, :price, :total_seats, :available_seats)
    end
end
