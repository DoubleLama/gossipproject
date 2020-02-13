class CitiesController < ApplicationController
  def show
   
    @city = City.find(params[:id])
    @city_gossips = []
    Gossip.all.each do |gossip|
       if gossip.user.city_id == @city.id
        @city_gossips << gossip
       end
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
