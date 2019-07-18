class Puppy < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :takers, through: :bookings, source: :user
  has_many :givers, through: :bookings
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true, allow_blank: true
  validates :age, presence: true, allow_blank: false, numericality: { only_integer: true, less_than: 15 }
  validates :breed, presence: true, allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validates :photo, presence: true, allow_blank: false

  include PgSearch::Model
  pg_search_scope :search_by_breed_and_name,
    against: [ :breed, :name ],
    using: {
      tsearch: { prefix: true }
    }
end
