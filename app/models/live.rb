class Live < ApplicationRecord
  belongs_to :genre, inverse_of: :lives
  belongs_to :artist
  has_many :artist_live
  accepts_nested_attributes_for :artist_live, reject_if: :all_blank, allow_destroy: true
end
