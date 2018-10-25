#put fetches here
module Adaptor

require 'rest-client'
require 'json'
require 'pry'
require_relative '../../config/api_key'

  def self.search_for_recipes_by_keyword(keyword)
    #"http://api.yummly.com/v1/api/recipes?_app_id=#{KEY[:app_id]}&_app_key=#{KEY[:app_key]}&q=#{keyword}&requirePictures=true"

     # "http://api.yummly.com/v1/api/recipes?_app_id=" + KEY[:app_id] + "&_app_key=" + KEY[:app_key] + "&q=" + keyword + "&requirePictures=true"
    url = "http://api.yummly.com/v1/api/recipes?_app_id=" + KEY[:app_id] + "&_app_key=" + KEY[:app_key] + "&q=" + keyword + "&requirePictures=true"
    response = RestClient.get(url)
    recipe_response = JSON.parse(response)
    recipe = recipe_response["matches"].sample
    id = recipe["id"]
    url_2 = "http://api.yummly.com/v1/api/recipe/" + id + "?_app_id=" + KEY[:app_id] + "&_app_key=" + KEY[:app_key]
    response_2 = RestClient.get(url_2)
    recipe_response_2 = JSON.parse(response_2)
    recipe_hash = {}
    recipe_hash["name"] = recipe_response_2["name"]
    recipe_hash["time"] = recipe_response_2["totalTime"]
    recipe_hash["source"] = recipe_response_2["source"]["sourceRecipeUrl"]
    recipe_hash["ingredients"] = recipe_response_2["ingredientLines"]
    recipe_hash["servings"] = recipe_response_2["numberOfServings"]
    recipe_hash["image"] = recipe_response_2["images"][0]["hostedLargeUrl"]

    recipe_hash
  end


  def self.search_for_random_recipe_by_ingredient(ingr1, ingr2, ingr3)
    url = "http://api.yummly.com/v1/api/recipes?_app_id=" + KEY[:app_id] + "&_app_key=" + KEY[:app_key] + "&q&requirePictures=true&allowedIngredient[]=" + ingr1 + "&allowedIngredient[]=" + ingr2 + "&allowedIngredient[]=" + ingr3
    response = RestClient.get(url)
    recipe_response = JSON.parse(response)
    recipe = recipe_response["matches"].sample
    id = recipe["id"]
    url_2 = "http://api.yummly.com/v1/api/recipe/" + id + "?_app_id=" + KEY[:app_id] + "&_app_key=" + KEY[:app_key]
    response_2 = RestClient.get(url_2)
    recipe_response_2 = JSON.parse(response_2)
    recipe_hash = {}
    recipe_hash["name"] = recipe_response_2["name"]
    recipe_hash["time"] = recipe_response_2["totalTime"]
    recipe_hash["source"] = recipe_response_2["source"]["sourceRecipeUrl"]
    recipe_hash["ingredients"] = recipe_response_2["ingredientLines"]
    recipe_hash["servings"] = recipe_response_2["numberOfServings"]
    recipe_hash["image"] = recipe_response_2["images"][0]["hostedLargeUrl"]
    recipe_hash
  end


# search_for_random_recipe_by_ingredient("chicken", "garlic", "oil")

end
