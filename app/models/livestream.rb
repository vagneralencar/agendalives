class Livestream < ApplicationRecord
  belongs_to :genre, inverse_of: :livestreams
  #belongs_to :artist
  has_many :live_artists
  accepts_nested_attributes_for :live_artists, reject_if: :all_blank, allow_destroy: true
end
