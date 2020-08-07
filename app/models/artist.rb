class Artist < ApplicationRecord
  belongs_to :genre
  has_many :livestreams
  has_many :live_artists
end
