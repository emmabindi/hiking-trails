class TrailsController < ApplicationController
  def index
    trails = Trail.all
    render json: { trails: trails }, status: 200
  end

  def create
    trail = Trail.new(trail_params)
    if trail.save 
      render json: {}, status: :created
    else
      render json: {errors: trail.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def trail_params
    params.require(:trail).permit(:name, :location, :difficulty, :distance)
  end
end
