class Food < ApplicationRecord
  belongs_to :user
  has_many :receipt_foods, foreign_key: :food_id
end
