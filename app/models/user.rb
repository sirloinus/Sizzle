class User < ApplicationRecord

  has_many :user_recipes
  has_many :recipes, through: :user_recipes

  validates :name, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/}

  has_secure_password

  attr_accessor :keyword
  attr_accessor :keywords

end
