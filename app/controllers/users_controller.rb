class UsersController < ApplicationController

  def edit
    @user = User.find(current_user.id)
  end

  def update
    User.update(user_params)
    redirect_to diaries_path
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end