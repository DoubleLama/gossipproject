class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l'e-mail
    user = User.find_by(email: params[:email])
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to gossips_path, notice: "Bienvenue #{User.find_by(id: session[:user_id]).first_name}!"
      # redirige où tu veux, avec un flash ou pas
    else
      flash.now[:danger] = "Utilisateur ou mot de passe incorrect!"
      @user = User.new
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :gossips
  end

end
