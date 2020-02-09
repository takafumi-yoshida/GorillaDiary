class LikesController < ApplicationController
  def create
    @diaries = Diary.includes(:user, :datetime).order(id:"DESC")
    @diary = Diary.find(params[:diary_id])
    @writer = User.find(@diary.user_id)
    @writer_diaries = @writer.diaries.order(created_at: :desc)
      respond_to do |format|
        if @like = current_user.likes.create(diary_id: params[:diary_id])
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

    respond_to do |format|
      if @like.destroy
         format.js
      end
    end

  end

end
