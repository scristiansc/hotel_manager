class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to hotels_path, alert: "Hotel no encontrado"
  end

  def new
  end

  def create
    hotel = Hotel.create(hotel_params)

    if hotel.persisted?
      redirect_to hotels_path, notice: "¡Hotel created successfully!"
    else
      redirect_to hotels_path, alert: "Something went wrong"
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to hotels_path, alert: "Hotel no encontrado"
  end

  def update
    hotel = Hotel.find(params[:id])
    hotel.update(hotel_params)

    redirect_to hotels_path, notice: "¡Hotel updated successfully!"
  end

  def destroy
    hotel = Hotel.find(params[:id])
    hotel.destroy

    redirect_to hotels_path, notice: "¡Hotel deleted successfully!"
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :rating, :room_number)
  end
end
