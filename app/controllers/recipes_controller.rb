require_relative "../adaptor/adaptor.rb"

class RecipesController < ApplicationController

  # helper_method :ingredients_string

  include Adaptor
  # include RecipeModule

  # before_action :set_user, only: [:show]

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    recipe_suggestion_hash = Adaptor.search_for_recipes_by_keyword(params[:recipe][:name])
    @recipe = Recipe.create(recipe_suggestion_hash)
    # @ingr = ingredients_string(@recipe["ingredients"])
    # @recipe_ingr = @recipe["ingredients"]
    redirect_to recipe_path(@recipe)
  end

  def search_keyword

  end

  #
  # def ingredients_string(string)
  #   array = string.split(/[\]\[\\\,"]/).reject(&:empty?)
  #   array - [" "]
  # end


  private

  def set_user
    @user = current_user
    # @user = User.find(session[:user_id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :time, :source, :ingredients, :servings, :image)
  end

end
