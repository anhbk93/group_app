class CommentsController < ApplicationController
  def index
    
  end
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create(user_id: current_user.id, comment: comment_params[:comment] )
    redirect_to :back
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :comment)
  end
end
