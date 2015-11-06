class CommentsController < ApplicationController
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
       params.require(:comment).permit(:body, :post_id)
     end

end
