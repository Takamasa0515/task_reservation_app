class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session
  #protect_from_forgery except: :sign_in
  before_action :configure_permitted_parameters, if: :devise_controller?
	

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

	private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :avatar])
  end

end