class Gemstone < ActiveRecord::Base
  has_many :reviews
  validates :name, presence: true
end
