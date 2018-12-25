class DiariesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @diaries = Diary.all
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to @diary
    else
      render new
    end
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to @diary
    else
      render edit
    end
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_url, notice: "Diary was successfully destroyed."
  end

  private
  def diary_params
    params.require(:diary).permit(:title, :body)
  end

end
