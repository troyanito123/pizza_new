class CreatePizzaModels < ActiveRecord::Migration[6.0]
  def change
    create_table :pizza_models do |t|
      t.decimal :cost, precision: 5, scale: 2
      t.references :size, null: false, foreign_key: true

      t.timestamps
    end
  end
end
