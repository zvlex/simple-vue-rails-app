module Admin
  class PostVersionsController < Admin::ApplicationController
    before_filter :find_post_version!, only: [:show, :approve, :decline, :edit_decline]

    def index
      @post_versions = PostVersion.where.not(aasm_state: :draft).order(created_at: :desc)
    end

    def show; end

    def approve
      if @post_version.approve!
        redirect_to admin_post_versions_path
      end
    end

    def decline
      @post_version.assign_attributes(post_version_params)

      if @post_version.decline!
        redirect_to admin_post_versions_path
      else
        render :edit_decline
      end
    end

    def edit_decline; end

    private

      def find_post_version!
        @post_version = PostVersion.find(params[:id])
      end

      def post_version_params
        params.require(:post_version).permit(:decline_reason)
      end
  end
end
