class UsersController < ApplicationController
  def show
    @ohayos = Ohayo.all
    @user
    @user = User.find(params[:id]) 
  end
end
