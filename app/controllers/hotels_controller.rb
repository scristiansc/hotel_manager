class HotelsController < ApplicationController
  def new
  end

  def index
    @hotels = Hotel.all
  end

  def create
    hotel = Hotel.create(
      name: params[:hotel][:name],
      address: params[:hotel][:address],
      rating: params[:hotel][:rating]
    )

    if hotel.persisted?
      flash.notice = "Hotel created successfully"
    else
      flash.alert = "Something went wrong"
    end

    redirect_to hotels_path
  end
end
