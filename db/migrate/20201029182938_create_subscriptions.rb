class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.timestamps
    end
  end
end
