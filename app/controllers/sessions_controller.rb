class SessionsController < ApplicationController

  def create
    # cherche s'il existe un utilisateur en base avec l'e-mail
    @user = User.find_by(email: params[:email])
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(password: params[:password])
      session[:user_id] = @user.id
      # redirige où tu veux, avec un flash ou pas
    else
      flash.now[:danger] = "Utilisateur ou mot de passe incorrect!"
      render 'new'
    end
  end

  def destoy
  end

  def new
    @user = User.find_by(email: params[:email])
  end
end
