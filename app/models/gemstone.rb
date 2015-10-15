class Gemstone < ActiveRecord::Base
  has_many :reviews
  has_many :images
  validates :name, length: { minimum: 3 }
end
