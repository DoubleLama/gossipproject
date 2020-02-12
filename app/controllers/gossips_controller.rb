class GossipsController < ApplicationController
  
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
    
    @gossip = Gossip.create(gossip_params)

    if @gossip.save

    redirect_to gossips_path

    else

    render 'new'

    end

  end

  def destroy

  end

  private

  def gossip_params

    params.require(:gossip).permit(:title, :content)

  end

end
