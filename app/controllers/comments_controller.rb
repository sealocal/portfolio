class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    if @comment.save
      @post.comments << @comment
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, notice: 'Comment was not saved successfully.'
    end
  end

  def update
    @post = Post.find(params)
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
