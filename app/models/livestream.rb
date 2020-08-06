class Livestream < ApplicationRecord
  belongs_to :genre, inverse_of: :livestreams
  belongs_to :artist
  has_many :artist_lives
  accepts_nested_attributes_for :artist_lives, reject_if: :all_blank, allow_destroy: true
end
