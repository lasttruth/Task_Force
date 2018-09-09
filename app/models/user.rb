class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games
  has_many :statuses, :through => :games


  validates :email, uniqueness: true
  validates :password, length: { minimum: 7,  too_long: "%{count} characters is the minimum allowed" }


end
