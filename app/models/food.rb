class Food < ApplicationRecord
  belongs_to :user
  has_many :receipt_foods, foreign_key: :food_id

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
