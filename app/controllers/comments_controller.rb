class CommentsController < ApplicationController
  skip_before_filter :require_login, only: [:index]

  def index
    @post = Post.find(params[:post_id])

    respond_to do |format|
      format.html { redirect_to @post }
      format.json do
        render json: @post.comments.parent_comments, each_serialize: CommentSerializer
      end
    end
  end

  def create
    @post = Post.find(params[:post_id])

    @comments = @post.comments

    if current_user.deleted_at?
      render json: { warning: t('ui.small_notifications.basic.user_banned') }
    else
      @comment = current_user.comments.build(comment_params)
      @comment.post = @post

      if @comment.save
        render json: @comments.parent_comments, each_serialize: CommentSerializer
      else
        render json: { errors: @comment.errors.full_messages, status: 422 }
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :parent_id)
    end
end
