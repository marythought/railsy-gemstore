class CreateGemstones < ActiveRecord::Migration
  def change
    create_table :gemstones do |t|
      t.string :name
      t.text :description
      t.integer :shine
      t.float :price
      t.integer :rarity
      t.string :color
      t.integer :faces

      t.timestamps null: false
    end
  end
end
