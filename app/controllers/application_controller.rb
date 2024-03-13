class ApplicationController < ActionController::API
  def set_current_user
    @current_user = User.last
  end
end
