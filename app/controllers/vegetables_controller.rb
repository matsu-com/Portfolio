class VegetablesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @vegetables = Vegetable.all
  end

  def show
    @vegetable = Vegetable.find(params[:id])
  end

  def new
    @vegetable = Vegetable.new
  end

  def create
    @vegetable = Vegetable.new(vegetable_params)
    @vegetable.user_id = current_user.id
    @vegetable.save
    redirect_to vegetable_path(@vegetable)
  end

  def edit
    @vegetable = Vegetable.find(params[:id])
    if @vegetable.user != current_user
      redirect_to vegetables_path, alert: "アクセスできません。"
    end
  end

  def update
    @vegetable = Vegetable.find(params[:id])
    if @vegetable.update(vegetable_params)
      redirect_to vegetable_path(@vegetable), notice: "更新しました。"
    else
      render :edit
    end
  end

  private
    def vegetable_params
      params.require(:vegetable).permit(:title, :body, :image)
    end
end
