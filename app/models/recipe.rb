class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  has_many :directions

  validates :title, presence: true
  validates :description, presence: true
end
