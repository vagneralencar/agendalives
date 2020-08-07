class LiveArtist < ApplicationRecord
  belongs_to :livestream
  belongs_to :artist
end
