class Trail < ApplicationRecord
  validates :name, presence: true
  validates_length_of :name, :within => 8..75, :too_long => "Please enter shorter trail name", :too_short => "Please enter longer trail name"
  validates :distance, presence: true, numericality: { greater_than: 0 }
  validates :difficulty, presence: true, numericality: { less_than: 5 }
  has_many :facility_trails
  has_many :facilities, through: :facility_trails
end
