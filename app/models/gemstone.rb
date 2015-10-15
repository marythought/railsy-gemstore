class Gemstone < ActiveRecord::Base
  has_many :reviews
  has_many :images
  validates :name, presence: true
end
