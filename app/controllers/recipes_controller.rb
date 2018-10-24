require_relative "../adaptor/adaptor.rb"
class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def show
    @hello = "HEEELLOOO"
  end

  def create
    x = search_for_recipes_by_keyword(params[:recipe][:name])
    puts "XXXXXXXXXXXXXXXXXXX#{x}"
    @recipe = Recipe.create(recipe_params)
    redirect_to current_user
  end

  def search_keyword

  end


  private

  def recipe_params
    byebug
    params.require(:recipe).permit(:name, :time, :source, :ingredients, :servings, :image)
  end

end
