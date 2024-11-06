class HomeController < ApplicationController
  def register
    @user = User.new
    @users = User.all
  end

  def top
    'hoge'
  end

  def about
  end
end
