class HotelsController < ApplicationController
  def new
  end

  def index
    @hotels = Hotel.all
  end

  def create
    hotel = Hotel.create(hotel_params)

    if hotel.persisted?
      redirect_to hotels_path, notice: "¡Hotel created successfully!"
    else
      redirect_to hotels_path, alert: "Something went wrong"
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :rating)
  end
end
