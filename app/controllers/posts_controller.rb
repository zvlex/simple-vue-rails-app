class PostsController < ApplicationController
  skip_before_filter :require_login, except: [:new, :edit, :create]
  before_filter :find_post!, only: [:show, :add_to_favorites]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def show; end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Post created'
    else
      render :new
    end
  end

  def preview
    html_data = MarkdownParser.new(params[:body]).to_html

    render html: html_data
  end

  def add_to_favorites
    if current_user.add_or_drop_favorites!(@post)

      notice, status =
        if current_user.included_in_favorites?(@post)
          [t('ui.small_notifications.favorite_added'), nil]
        else
          [t('ui.small_notifications.favorite_added'), true]
        end
    else
      render nothing: true
    end

    render json: { status: status, notice: notice, quantity: @post.favorites_quantity }

  end

  private

    def find_post!
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
