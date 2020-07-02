class Trail < ApplicationRecord
  validates :name, presence: true
  validates :difficulty, presence: true, numericality: { less_than: 5 }
end
