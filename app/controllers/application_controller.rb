# frozen_string_literal: true

# Application's home controller
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  def configure_permitted_parameters
    added_attrs = [:username, :email, :user_type, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:username, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
