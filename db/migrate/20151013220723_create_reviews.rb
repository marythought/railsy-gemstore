class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string :body
      t.string :author
      t.references :gemstone, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
