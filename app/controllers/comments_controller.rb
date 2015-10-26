class CommentsController < ApplicationController
	before_action :authenticate_user!

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.create(params[:comment].permit(:commenter, :body))
    
    @comment.picture_id = @picture.id
    if @comment.save 
      redirect_to picture_path(@picture)
    else
      flash[:notice] = 'Unable to submit blank comments'
      redirect_to :back
    end
  end
end
