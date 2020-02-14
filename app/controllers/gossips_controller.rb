class GossipsController < ApplicationController
include SessionsHelper
before_action :authenticate_user, except: [:index]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = @gossip.user
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])

    if current_user == @gossip.user
      @gossip.update(gossip_params)
      redirect_to gossip_path
    else
      flash.alert = "Vous n'êtes pas l'auteur de ce gossip !"
      redirect_to gossips_path
    end
    
  end

  def new
    @gossip = Gossip.new
  end

  def create
     @gossip = Gossip.new(user: current_user, title: params[:title],content: params[:content])

     if @gossip.save
      redirect_to gossips_path, notice: "Tu as créé un nouveau potin."

    else
      render :new
      flash.alert = "Il y a un problème, recommence"
    end

  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if current_user == @gossip.user
    
      if @gossip.destroy
        redirect_to gossips_path
  
      else
        render :edit
        flash.alert = "Il y a un problème, recommence"
      end

    else
      flash.alert = "Vous n'êtes pas l'auteur de ce gossip !"
      redirect_to gossips_path
    end
    

  end

  private

  def gossip_params

    params.require(:gossip).permit(:title, :content)

  end

  def authenticate_user
    
    unless current_user
      flash.alert = "Vous devez être connecté"
      redirect_to new_session_path
    end
    
  end

end
