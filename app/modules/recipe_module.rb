module RecipeModule

  def ingredients_string(string)
    array = string.split(/[\]\[\\\,"]/).reject(&:empty?)
    array - [" "]
  end

end
