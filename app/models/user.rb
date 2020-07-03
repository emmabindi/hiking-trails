class User < ApplicationRecord
  has_many :trails
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
