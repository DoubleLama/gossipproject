class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
  end

  def index
  end

  def delete
  end

  def edit
  end

  def update
  end
end
