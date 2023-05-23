class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, foreign_key: :user_id
  has_many :foods, foreign_key: :user_id
  attribute :recipes_counter, :integer, default: 0
end
