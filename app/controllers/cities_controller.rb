class CitiesController < ApplicationController
  def show
    @gossips = Gossip.all
    @i=params[:id]
    @city = City.find(params[:id])
    @city_gossips = []
    Gossip.all.each do |gossip|
      @city_gossips << gossip if gossip.user.city.id == @city.id
    end
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
