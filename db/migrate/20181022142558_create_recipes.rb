class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :time
      t.string :source
      t.string :ingredients, array: true
      t.integer :servings
      t.string :image

      t.timestamps
    end
  end
end
