class CommentsController < ApplicationController
  # before_filter :require_login, only: [:create, :edit, :update]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      if request.xhr?
        render json: @post.comments
      else
        redirect_to comments_path
      end
    end
  end


  private

     def comment_params
       params.require(:comment).permit(:body, :post_id, :user_id)
     end

end
