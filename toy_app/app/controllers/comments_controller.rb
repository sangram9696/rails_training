class CommentsController < ApplicationController
  def create
    #logger.info "#{params.inspect}"
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create(params[:comment].permit(:name,:body))
    redirect_to micropost_path(@micropost)
  end
end


