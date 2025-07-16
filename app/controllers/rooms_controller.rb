class RoomsController < ApplicationController
    def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to rooms_path, alert: "Hotel no encontrado"
  end

  def new
  end

  def create
    room = Room.create(room_params)

    if room.persisted?
      redirect_to rooms_path, notice: "¡Hotel created successfully!"
    else
      redirect_to rooms_path, alert: "Something went wrong"
    end
  end

  def edit
    @room= Room.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to rooms_path, alert: "Hotel no encontrado"
  end

  def update
     = Room.find(params[:id])
    .update(room_params)

    redirect_to rooms_path, notice: "¡Hotel updated successfully!"
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy

    redirect_to rooms_path, notice: "¡Hotel deleted successfully!"
  end

  private

  def room_params
    params.require(:room).permit(:room_number, :room_type, :price)
  end
end
