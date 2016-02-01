class PostsController < ApplicationController
  before_filter :require_login, except: [:index, :show]
  before_filter :find_post!, only: [:show, :add_to_favorites, :vote]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def show
    @post_json_data = PostSerializer.new(@post, scope: current_user).to_json
  end

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
          [t('ui.small_notifications.favorite_added'), false]
        else
          [t('ui.small_notifications.favorite_removed'), true]
        end
    else
      render nothing: true
    end

    render json: { notice: notice, quantity: @post.favorites_quantity, status: status }
  end

  def vote
    json_data  =
      if current_user.rate_post(@post, params[:rate])
        { notice: t('ui.small_notifications.post_rating.voted') }
      else
        { warning: t('ui.small_notifications.post_rating.already_voted') }
      end

    render json:  json_data.merge(quantity: @post.rating_quantity)
  end

  private

    def find_post!
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
