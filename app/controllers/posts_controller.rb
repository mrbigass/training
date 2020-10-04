class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new; end
  def create
    post = Post.new(post_params)
    post.save!
    redirect_to posts_path
  end

  def show; end

  private

  def post_params
    params.require(:post).permit(
      :name, :text
    ).merge(user_id: current_user.id)
  end
end