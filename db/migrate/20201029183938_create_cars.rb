class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.references :maker
      t.references :model
      t.integer :year, null: false
      t.string :color, null: false
      t.references :subscription
      t.datetime :availability_date, null: false
      t.timestamps
    end
  end
end
