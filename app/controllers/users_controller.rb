class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:account, :profile,:profile_edit, :profile_update]
  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def profile_edit
    @user = current_user
  end

  def profile_update
    @user = current_user
    if @user.update(profile_params)
      redirect_to users_profile_path
    else
      render "profile_edit"
    end 
  end
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:profile_update, keys: [:name, :introduction])
  end
    
  def profile_params
    params.require(:user).permit(:name, :introduction)
  end
end
