class Artist < ApplicationRecord
  belongs_to :genre
  has_many :lives
end
