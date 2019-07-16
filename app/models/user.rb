class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :puppies
  has_many :bookings
  has_many :taking_puppies, through: :bookings, source: :puppy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
