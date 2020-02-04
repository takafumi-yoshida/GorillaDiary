class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @user = User.find(current_user.id)
    if @comment.save
      respond_to do |format| 
        format.json
      end
    else
      @diary = Diary.find(params[:id])
      @comments = Comment.includes(:user).order(id:"DESC")
      flash.now[:alert] = 'メッセージを入力してください。'
      render diary_path(params[:diary_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, diary_id: params[:diary_id])
  end
end
