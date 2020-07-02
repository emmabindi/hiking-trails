class TrailsController < ApplicationController
  before_action :set_trail, only: [:update, :destroy]
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

  def update
    @trail.update(trail_params)
    render json: "Trail Updated", status: 200
  end

  def destroy
    @trail.destroy
    render json: "Trail deleted", status: 200
  end

  private
  def trail_params
    params.require(:trail).permit(:name, :location, :difficulty, :distance)
  end

  def set_trail
    @trail = Trail.find(params[:id])
  end 
end
