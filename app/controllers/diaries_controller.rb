class DiariesController < ApplicationController
  
  def index
    @diary = Diary.new
    @diaries = Diary.includes(:user, :datetime).order(id:"DESC")
  end

  def new
    @diary = Diary.new
  end
  
  def create
    @diary = Diary.create(diary_params)
    if @diary.save
      redirect_to (diaries_path)
    else
      render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
    @user = User.find(current_user.id)
    @comment = Comment.new
    @like = Like.new
    new_history = @diary.browsing_histories.new
    @comments = @diary.comments.includes(:user).order(id:"DESC")
    
    unless @user.diaries.exists?(id: params[:id]) then
      new_history.user_id = current_user.id

      if current_user. browsing_histories.exists?(diary_id: params[:id])
        old_history = current_user.browsing_histories.find_by(diary_id: params[:id])
        old_history.destroy
      end
      new_history.save
      
      histories_stock_limit = 10
      histories = current_user.browsing_histories.all
      if histories.count > histories_stock_limit
        histories[0].destroy
      end
    end
  end
  private

  def diary_params
      d1 = Date.today.to_s
      d2 = Date.parse(d1)
      @datetime = d2
      d3 = Datetime.last
      if d3 == nil
        @datetime = Datetime.create(year: d2.year, month: d2.month, day: d2.day)
      elsif d2.year != d3.year || d2.month != d3.month || d2.day != d3.day
        @datetime = Datetime.create(year: d2.year, month: d2.month, day: d2.day)
      else
        @datetime = d3
      end
      params.require(:diary).permit(:title, :content).merge(user_id: current_user.id, datetime_id: @datetime.id)
  end
end