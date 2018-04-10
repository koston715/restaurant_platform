class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end

private

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "您無此權限!"
      redirect_to root_path
    end
  end