class PlantsController < ApplicationController
  def new
    @plant = Plant.new
    @garden = Garden.find(params[:garden_id])
  end

  def create
    # find the garden
    @garden = Garden.find(params[:garden_id])
    # find the plant with the filled out form
    @plant = Plant.new(plant_params)
    # assign the plant to the garden
    @plant.garden_id = @garden.id
    # save the plant!
    if @plant.save
      redirect_to @garden
    else
      render :new
    end
  end

  def destroy
    # find the plant
    @plant = Plant.find(params[:id])
    # find the garden the plant belongs to
    @garden = @plant.garden
    # KILL the plant
    @plant.destroy
    # at this point, there is no plant 😱
    #redirect to the garden of the killed plant
    redirect_to @garden

  end

  private

  def plant_params
    params.require(:plant).permit(:name, :description)
  end
end
