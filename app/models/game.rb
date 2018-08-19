class Game < ApplicationRecord
  has_many :trakers
  validates :title, presence: true

end
