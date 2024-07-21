class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
  # you can show action of devise_controller by way 
  # run statement :  Devise::RegistrationsController.action_methods in console 

 
end
