class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash.now[:change] = "アカウント詳細変更完了"
      render :show
    else
      flash.now[:notgood] = "エラー"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :image_cache, :password, :password_confirmation)
  end

end
