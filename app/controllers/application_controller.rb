class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do 
  	redirect_to root_path, notice: "The path you are looking for doesn't exist."
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :mobile, :gender_id, :dob])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :mobile, :gender_id, :dob])
  end

end
