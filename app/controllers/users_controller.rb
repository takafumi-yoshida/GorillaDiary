class UsersController < ApplicationController

  def edit
    @edit = "this is edit "
    @user = User.find(current_user.id)
    @mydiaries = @user.diaries.order(created_at: :desc)
    @favoritediaries = Like.where(user_id: @user).includes(:user)
    @BrowsingHistories = BrowsingHistory.where(user_id: @user).order(created_at: :desc)
    @followes = Relationship.where(user_id: @user).order(created_at: :desc)
    @historydiaries1 = Diary.includes(:user)
    @historydiaries2 = []
    @BrowsingHistories.each do |history|
      @historydiaries2 << @historydiaries1.find(history.diary_id)
    end

    @followusers1 = User.all
    @followusers2 = []

    @followes.each do |follow|
      @followusers2 << User.find(follow.follow_id)
    end
  end

  def update
    User.update(user_params)
  end

  def show
    @user = User.find(params[:id])
    @diaries = @user.diaries.order(created_at: :desc)
  end
  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end