class Game < ApplicationRecord
  has_many :statuses
  validates :title, presence: true

end
