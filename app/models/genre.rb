class Genre < ApplicationRecord
  has_many :disc_genres, dependent: :destroy 
  has_many :discs, through: :disc_genres
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 1...80 }
end