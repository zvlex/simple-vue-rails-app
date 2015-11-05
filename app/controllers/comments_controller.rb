class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      if request.xhr?
        render json: Comment.order(created_at: :asc)
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
