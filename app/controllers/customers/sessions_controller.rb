# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    respond_with resource, location: root_path
  rescue
    set_flash_message!(:alert, :invalid)
    redirect_to new_customer_session_path
  end

  # DELETE /resource/sign_out
  def destroy
  end

  private
    def after_sign_out_path_for(resource_or_scope)
      debugger
      new_customer_session_path
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
