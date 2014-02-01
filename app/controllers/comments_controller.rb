class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, notice: 'Comment was not saved successfully.'
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.approve!
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Comment was successfully approved.'
    else
      redirect_to @post, notice: 'Comment was NOT approved.'
    end
  end

  def destroy
    set_comment
    @post = @comment.post
    if @comment.destroy
      redirect_to @post, notice: 'Comment annihilated!'
    else
      redirect_to @post, notice: 'Comment was not removed!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, (:approved if CommentPolicy.new(current_user, @comment).approve?))
    end
end
