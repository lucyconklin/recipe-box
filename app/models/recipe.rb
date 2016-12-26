class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes

  accepts_nested_attributes_for :ingredients

  validates :title, presence: true
  validates :description, presence: true
end
