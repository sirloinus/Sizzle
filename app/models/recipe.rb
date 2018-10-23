class Recipe < ApplicationRecord

  has_many :user_recipes
  has_many :users, through: :user_recipes

  def ingredients_string(string)
    with_empty_strings = string.split(/[\p{punct}]+/)
    # no_empty_strings = nil
    # with_empty_strings.each do |s|
    #   if !s.empty?
    no_empty_strings = with_empty_strings.split(/\A[[:space:]]*\z/).flatten
    no_empty_strings
  end


end
