class User < ApplicationRecord
  has_secure_password
  has_many :games
  has_many :statuses, :through => :games

  validates :email, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 7,  too_long: "%{count} characters is the minimum allowed" }


end
