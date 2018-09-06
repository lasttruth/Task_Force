class Game < ApplicationRecord
  has_many :statuses
  has_many :users, :through => :rides
  validates :title, presence: true

end
