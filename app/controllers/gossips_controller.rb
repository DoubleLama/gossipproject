class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
    id = session[:user_id]
    @user = User.find(id) #et hop, cette variable @user est l'instance User contenant toutes les infos de l'utilisateur connecté
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

    @gossip.update(gossip_params)

    redirect_to gossip_path
  end

  def new
    @gossip = Gossip.new
  end

  def create
     @gossip = Gossip.new(user: User.last, title: params[:title],content: params[:content])

     if @gossip.save
      redirect_to gossips_path, notice: "Tu as créé un nouveau potin."

    else
      render :new
      flash.alert = "Il y a un problème, recommence"
    end

  end

  def destroy
    @gossip = Gossip.find(params[:id])

    if @gossip.destroy
      redirect_to gossips_path

    else
      render :edit
      flash.alert = "Il y a un problème, recommence"
    end

  end

  private

  def gossip_params

    params.require(:gossip).permit(:title, :content)

  end

end
