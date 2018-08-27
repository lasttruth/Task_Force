class User < ApplicationRecord
  has_secure_password
  has_many :games
  has_many :statuses, :through => :games

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 7,  too_long: "%{count} characters is the minimum allowed" }

  def self.chop_email(user_id)
    self.find(user_id).email.scan(/(^\w+)/)[0].first
  end

end
