class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:account, :profile]
  def account
    @user = User.find_by(id: current_user.id)
  end

  def profile
    @user = User.find_by(id: current_user.id)
  end
end
