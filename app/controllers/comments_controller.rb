class CommentsController < ApplicationController

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :body, (:approved if CommentPolicy.new(current_user, @comment).approve?))
    end
end
