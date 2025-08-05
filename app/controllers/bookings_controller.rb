class BookingsController < ApplicationController
    def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    redirect_to bookings_path, alert: "Booking no encontrado"
  end

  def new
  end

  def create
    booking = Booking.create(booking_params)

    if booking.persisted?
      redirect_to bookings_path, notice: "¡Booking created successfully!"
    else
      redirect_to bookings_path, alert: "Something went wrong"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to bookings_path, alert: "Booking no encontrado"
  end

  def update
    booking = Booking.find(params[:id])
    booking.update(booking_params)

    redirect_to bookings_path, notice: "¡Booking updated successfully!"
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy

    redirect_to bookings_path, notice: "¡Booking deleted successfully!"
  end

  private

  def booking_params
    params.require(:booking).permit(:room_id, :user_id, :start_date, :end_date)
  end
end
