class DiariesController < ApplicationController
  
  def index
    
  end

  def new
    @diary = Diary.new
  end
  
  def create
    Diary.create()
  end
end
