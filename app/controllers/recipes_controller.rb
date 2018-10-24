require_relative "../adaptor/adaptor.rb"

class RecipesController < ApplicationController

  include Adaptor
  include RecipeModule

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    recipe_suggestion_hash = Adaptor.search_for_recipes_by_keyword(params[:recipe][:name])
    @recipe = Recipe.create(recipe_suggestion_hash)
    @ingr = ingredients_string(@recipe["ingredients"])
    redirect_to recipe_path(@recipe)
  end

  def search_keyword

  end


  private

  def recipe_params

    params.require(:recipe).permit(:name, :time, :source, :ingredients, :servings, :image)
  end

end
