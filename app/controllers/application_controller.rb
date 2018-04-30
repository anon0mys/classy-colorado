class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_admin?

  def current_admin?
    current_user && current_user.admin?
  end
end
