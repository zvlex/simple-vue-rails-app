class PostVersionsController < ApplicationController
  before_filter :require_login
  before_filter :find_post_version!, except: :create

  def show; end

  def edit; end

  def create
    @post_version = current_user.post_versions.build(post_version_params)

    if @post_version.save
      redirect_to post_version_path(@post_version)
    else
      render 'posts/new'
    end
  end

  def update
    # TODO: show notification
    if @post_version.on_moderation?
      redirect_to post_version_path(@post_version), notice: 'Can not modify post already was sent on moderation'
      return
    end

    if @post_version.update_or_create_post_version!(post_version_params)
      redirect_to post_version_path(@post_version)
    end
  end

  def send_to_moderation
    if @post_version.send_to_moderation!
      redirect_to '/posts/on_moderation'
    end
  end

  private

    def post_version_params
      params.require(:post_version).permit(:title, :body, :context)
    end

    def find_post_version!
      @post_version = current_user.post_versions.find(params[:id])
    end
end
