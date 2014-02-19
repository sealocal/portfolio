class CommentsController < ApplicationController
  before_action :load_commentable, only: [:create, :update]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def create
    @comment = @commentable.comments.build(comment_params)
    authorize @comment
    if @comment.save
      redirect_to @commentable, notice: 'Comment was successfully created.'
    else
      redirect_to @commentable, notice: 'Comment was not saved successfully.'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.approve!
    if @comment.update(comment_params)
      redirect_to @commentable, notice: 'Comment was successfully approved.'
    else
      redirect_to @commentable, notice: 'Comment was NOT approved.'
    end
  end

  def destroy
    set_comment
    @commentable = @comment.commentable
    if @comment.destroy
      redirect_to @commentable, notice: 'Comment annihilated!'
    else
      redirect_to @commentable, notice: 'Comment was not removed!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def load_commentable
      resource, id = request.path.split('/')[1, 2]                        #posts/1/
      @commentable = resource.singularize.classify.constantize.find(id)   #P.find(1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, (:approved if CommentPolicy.new(current_user, @comment).approve?))
    end

    def user_not_authorized
      flash[:error] = "You must log in with Twitter to comment!"
      redirect_to request.headers["Referer"] || root_path
    end
end
