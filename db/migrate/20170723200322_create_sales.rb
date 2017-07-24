class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.references :shoe, foreign_key: true
      t.references :buyer
      t.references :seller

      t.timestamps
    end
  end
end
