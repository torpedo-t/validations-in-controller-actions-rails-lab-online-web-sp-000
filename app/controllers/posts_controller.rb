require 'pry'
class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
    set_post!
  end

  def edit
  end

  def update
    set_post!
    #binding.pry
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
