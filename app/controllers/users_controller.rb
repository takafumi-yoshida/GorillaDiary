class UsersController < ApplicationController

  def edit
    @edit = "this is edit "
    @user = User.find(current_user.id)
  end

  def update
    User.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end