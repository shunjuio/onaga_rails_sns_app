class HomeController < ApplicationController
  def register
    @user = User.new
    @users = User.all
  end

  def top
    @posts = Post.all
    render layout: "application"
  end

  def about
  end
end
