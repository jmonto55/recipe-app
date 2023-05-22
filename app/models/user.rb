class User < ApplicationRecord
  has_many :receipts, foreign_key: :user_id
  has_many :foods, foreign_key: :user_id
  attribute :receipts_counter, :integer, default: 0
end
