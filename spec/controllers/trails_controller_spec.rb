require 'rails_helper'

RSpec.describe TrailsController, type: :controller do 
  it do
    attributes = attributes_for(trail)
    should permit(:name, :location, :difficulty, :distance, :user_id)
    .for(:create, params: {trails: attributes})
    .on(:trail)
  end
end