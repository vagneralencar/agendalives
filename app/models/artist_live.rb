class ArtistLive < ApplicationRecord
  belongs_to :livestream
  belongs_to :artist
end
