class UserRecipesController < ApplicationController

  def index
    @user_recipe = UserRecipe.all
  end

  def show
    @user_recipe = UserRecipe.find(params[current_user])
  end

  def new
  end

  def create

    @user_recipe = UserRecipe.new
    @user_recipe.user_id = current_user.id
    @user_recipe.recipe_id = Recipe.last.id
    @user_recipe.name = Recipe.last.name
    @user_recipe.save
    redirect_to user_recipes_path
  end

  def destroy
  end

  private

  def user_recipe_params
    params.require(:user_recipe).permit([:name, :user_id, :recipe_id])
  end

end
