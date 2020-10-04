class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.image && @picture.image.url
      render :confirm
    else
      flash[:check] = '画像がありません'
      render :new
    end

  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @picture.save
        flash[:done] = '投稿完了'
        redirect_to @picture
      else
        render :new
      end
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def index
    @pictures = Picture.all
  end

  def edit
    @picture = Picture.find(params[:id])
    if @picture.user_id == current_user.id
      render :edit
    else
      flash[:notice] = '別のユーザーの投稿です'
      redirect_to pictures_path
    end
  end

  def update
    if params[:back]
      @pictures = Picture.all
      render :index
    else
      @picture = Picture.find(params[:id])
      @picture.update(picture_params)
      flash[:edit] = '編集完了'
      redirect_to pictures_path
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.user_id == current_user.id
      @picture.destroy
      flash[:destroy] = '削除完了'
      redirect_to pictures_path
    else
      flash[:notice] = '別のユーザーの投稿です'
      redirect_to pictures_path
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end

end
