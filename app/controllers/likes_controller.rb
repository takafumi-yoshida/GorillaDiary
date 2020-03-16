class LikesController < ApplicationController
  def create
    @diaries = Diary.includes(:user, :datetime).order(id:"DESC")
    @diary = Diary.find(params[:diary_id])
    @writer = User.find(@diary.user_id)
    @writer_diaries = @writer.diaries.order(created_at: :desc)
    @like = current_user.likes.new(diary_id: params[:diary_id])
      if @like.save
        respond_to do |format|
          format.js
        end
      end

  end

  def destroy
    @like = Like.find_by(diary_id: params[:diary_id],user_id: current_user.id)
    @diaries = Diary.includes(:user, :datetime).order(id:"DESC")
    @diary = Diary.find(params[:diary_id])
    @writer = User.find(@diary.user_id)
    @writer_diaries = @writer.diaries.order(created_at: :desc)
    if @like.destroy
      respond_to do |format|
        format.js
      end
    end

  end

end
