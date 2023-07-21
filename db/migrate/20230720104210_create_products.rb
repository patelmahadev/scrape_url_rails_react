class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :url
      t.string :title
      t.text :description
      t.decimal :price
      t.string :product_image
      t.string :size

      t.timestamps
    end
  end
end
