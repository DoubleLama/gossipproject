class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
  end

  def show
    id = session[:user_id]
    @user = User.find(id)
  end

  def new
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], password: params[:password])
   end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], password: params[:password])

    if @user.save
      redirect_to gossips_path, notice: "Bienvenue, nouvel utilisateur !"
    else
      render 'new'
      flash.alert = "Il y a un problème, recommence"
    end
  end

  def delete
  end

  def edit
  end

  def update
  end

private

  def user_params
    User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], password: params[:password])
  end

end
