class GossipsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
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
      redirect_to gossips_path, notice: "Tu as crée un nouveau potin."

    else 
      render "new"
      flash.alert = "Il y a un problème, recommence"
    end

  end 

  def destroy
    @gossip = Gossip.find(params[:id])

    if @gossip.destroy
      redirect_to gossips_path

    else
      render "edit"
      flash.alert = "Il y a un problème, recommence"
    end

  end
  
  private

  def gossip_params

    params.require(:gossip).permit(:title, :content)

  end

end