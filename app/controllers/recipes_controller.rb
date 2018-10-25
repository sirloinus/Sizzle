require_relative "../adaptor/adaptor.rb"

class RecipesController < ApplicationController

  # helper_method :ingredients_string

  include Adaptor
  # include RecipeModule

  # before_action :set_user, only: [:show]

  def new
    @recipe = Recipe.new
  end

  def new_for_three_ingr
    @recipe = Recipe.new
    render :search_three
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  def create
    search_term = !!params[:keyword] ? params[:keyword] : params[:recipe][:name]
    # if !!params[:keyword]
    #   search_term = session[:keyword]
    # else
    #   search_term = params[:recipe][:name]
    #   session[:keyword] = search_term
    # end
    recipe_suggestion_hash = Adaptor.search_for_recipes_by_keyword(search_term)
    @recipe = Recipe.create(recipe_suggestion_hash)
    # @ingr = ingredients_string(@recipe["ingredients"])
    # @recipe_ingr = @recipe["ingredients"]
    redirect_to recipe_path(@recipe, :keyword => search_term)
  end

  def create_with_ingredients
    search_term = !!params[:keywords] ? params[:keywords] : [params[:recipe][:name], params[:recipe][:image], params[:recipe][:source]]
    recipe_suggestion_hash = Adaptor.search_for_random_recipe_by_ingredient(search_term[0], search_term[1], search_term[2])
    @recipe = Recipe.create(recipe_suggestion_hash)
    redirect_to recipe_path(@recipe, :keywords => search_term)
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
