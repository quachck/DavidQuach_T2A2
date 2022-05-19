class BookingsController < ApplicationController
  before_action :eager_load
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :set_timeslot, only: %i[ new create ]
  before_action :authenticate_user!

  def sales
    @bookings = Booking.where(instructor: current_user).order(created_at: :desc)
  end

  def purchases
    @bookings = Booking.where(attendee: current_user).order(created_at: :desc)
  end

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @timeslot.update_ticket_count
    @booking = Booking.new(booking_params)
    @instructor = @timeslot.workshop.user

    @booking.timeslot_id = @timeslot.id
    @booking.attendee_id = current_user.id
    @booking.instructor_id = @timeslot.workshop.user_id

    respond_to do |format|
      if @booking.save
        format.html { redirect_to root_url, notice: "Booking was successfully created." }
        # format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_timeslot
      @timeslot = Timeslot.find(params[:timeslot_id])
    end

    #eager load associations 
    def eager_load
      @bookings = Booking.includes(:timeslot)
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.fetch(:booking, {}).permit(:timeslot_id)
    end
end
