class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, uniqueness: true
  validates :title, presence: true, allow_blank: false
  validates :overview, presence: true, allow_blank: false
end
