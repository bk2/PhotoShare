class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]

  def index
     @pictures = Picture.all.order("created_at DESC")
  end
  
  def new
  	@picture = current_user.pictures.build
  end

  def create
  	@picture = current_user.pictures.build(picture_params)

  	if @picture.save
  		redirect_to @picture, notice: "Successfully created new picture" 
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: "picture updated"
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to root_path
  end

  private

  def find_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
  	params.require(:picture).permit(:title, :description, :image)
  end

end
