class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.integer :percentage
      t.integer :sweetness
      t.string :image

      t.timestamps
    end
  end
end
