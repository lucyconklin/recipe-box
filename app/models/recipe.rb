class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients

  validates :title, presence: true
  validates :description, presence: true
end
