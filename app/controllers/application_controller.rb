class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_user_time_zone



private

def set_user_time_zone
  Time.zone = current_user.time_zone if !current_user.nil?
end
rescue_from CanCan::AccessDenied do |exception|
 redirect_to root_path, :alert => exception.message
end

rescue_from NoMethodError do |exception|
redirect_to new_user_session_path, :alert => "You need to login, before continue!"
end

end
