class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to users_path, alert: "User no encontrado"
  end

  def new
  end

  def create
    user = User.create(user_params)

    if user.persisted?
      redirect_to users_path, notice: "¡User created successfully!"
    else
      redirect_to users_path, alert: "Something went wrong"
    end
  end

  def edit
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to users_path, alert: "User no encontrado"
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    redirect_to users_path, notice: "¡User updated successfully!"
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to users_path, notice: "¡User deleted successfully!"
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :email)
  end
end
