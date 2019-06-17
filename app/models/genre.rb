class Genre < ApplicationRecord
  has_many :fanfics
  validates :name, presence: true, length: {minimum: 2}
  has_ancestry
end
