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
    @comment = Comment.new
    @comments = @diary.comments.includes(:user).order(id:"DESC")
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