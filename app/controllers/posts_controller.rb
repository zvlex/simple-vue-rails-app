class PostsController < ApplicationController
  before_filter :find_post!, only: :show

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @comments = @post.comments.to_json
  end

  def create
    binding.pry
  end

  private

    def find_post!
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title_ru, :title_en, :body_ru, :body_en, :source)
    end
end