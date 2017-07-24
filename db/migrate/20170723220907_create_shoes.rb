class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoes do |t|
      t.string :product
      t.float :price
      t.references :user, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
