class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'Admin area'
    end
  end
end
