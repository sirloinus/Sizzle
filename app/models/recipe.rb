class Recipe < ApplicationRecord

  has_many :user_recipes
  has_many :users, through: :user_recipes

end


# def ingredients_string(string)
#   string.split(/[\]\[\\\,"\s]/).reject(&:empty?)
# end
