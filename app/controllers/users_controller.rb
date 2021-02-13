class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, except: :show
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Your account was successfully updated'
    else
      render :edit
    end
  end

  def destroy
     @user.destroy
     redirect_to root_path, notice: 'Your account was successfully deleted'
  end

  private

  def set_current_user
    @user = current_user
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end