#put fetches here
require 'rest-client'
require 'json'
require 'pry'
require_relative '../../config/api_key'


  def search_for_recipes_by_keyword(keyword)
    url = "http://api.yummly.com/v1/api/recipes?_app_id=" + KEY[:app_id] + "&_app_key=" + KEY[:app_key] + "&q=" + keyword + "&requirePictures=true"
    response = RestClient.get(url)
    recipe_response = JSON.parse(response)
    recipes = recipe_response["matches"]
    
    # recipes_array = []
    # binding.pry
    # recipes.each do |r|
    #   recipes_array << r
    # end

  end
    #incomplete

  def search_for_random_recipe_by_ingredient
  end

search_for_recipes_by_keyword("pasta")
