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
    if @trail.update(trail_params)
      render json: {}, status: :no_content
    else
      render json: {errors: @trail.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @trail.delete
    render json: {}, status: :no_content
  end

  private
  def trail_params
    params.require(:trail).permit(:name, :location, :difficulty, :distance)
  end

  def set_trail
    @trail = Trail.find(params[:id])
  end 
end
