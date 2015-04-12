class CreateCalcs < ActiveRecord::Migration
  def change
    create_table :calcs do |t|
      t.string :name
      t.decimal :mass_fuel_total

      t.timestamps null: false
    end
  end
end
