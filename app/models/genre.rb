class Genre < ApplicationRecord
    paginates_per 10
    has_many :artists
    has_many :lives
end
