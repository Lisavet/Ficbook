class CommentsController < ApplicationController
  def create
    @fanfic = Fanfic.find(params[:fanfic_id])
    @comment = @fanfic.comments.create(comment_params)
    redirect_to fanfic_path(@fanfic)
  end

  private def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
