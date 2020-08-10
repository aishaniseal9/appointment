class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
      params.require(:user).permit(:email,:password,:password_confirmation,:name,:contactno,:address,:dob,:bloodgrp)
  end
  def account_update_params
      params.require(:user).permit(:email,:password,:password_confirmation,:current_password,:name,:contactno,:address,:dob,:bloodgrp)
  end
  end