# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
    super
    redirect_to root_path
  end

  # POST /resource/password
  def create
    redirect_to root_path
    super
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    redirect_to root_path
    super
  end

  # PUT /resource/password
  def update
    redirect_to root_path
    super
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
