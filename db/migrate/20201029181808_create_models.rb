class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.references :maker
      t.string :name, null: false
    end
  end
end
