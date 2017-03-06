class CommentsController < ApplicationController
  def create
    #logger.info "#{params.inspect}"
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create(params[:comment].permit(:name,:body))
    redirect_to micropost_path(@micropost)
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
        format.html { redirect_to @micropost }
        format.js
    end
  end

  def edit
    #1st you retrieve the post thanks to params[:post_id]
    @micropost = Micropost.find(params[:micropost_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = @micropost.comments.find(params[:id])
  end

   def update
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.find(params[:id])

    if @comment.update(params[:comment].permit(:body))
      redirect_to @micropost
    else
      render 'edit'
    end
  end

end


