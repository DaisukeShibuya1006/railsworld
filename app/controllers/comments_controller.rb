class CommentsController < ApplicationController
    def create
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      if @comment.save
        flash[:success] = "コメント成功"
        redirect_back(fallback_location: root_path)
      else
        flash[:danger] = "コメント失敗"
        redirect_back(fallback_location: root_path)
      end
    end

  private
  
    def comment_params
      params.require(:comment).permit(:content, :micropost_id)
    end
end
