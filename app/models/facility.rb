class Facility < ApplicationRecord
  validates :name, presence: true
  validates_length_of :name, :within => 3..55, :too_long => "Please enter shorter trail name", :too_short => "Please enter longer trail name"

  has_many :facility_trails
  has_many :trails, through: :facility_trails
end
