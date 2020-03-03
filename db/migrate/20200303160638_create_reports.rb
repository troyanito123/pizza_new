class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.date :day
      t.time :time
      t.string :prevalence
      t.string :email
      t.boolean :state, default: false

      t.timestamps
    end
  end
end
