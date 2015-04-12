class CreateCalcs < ActiveRecord::Migration
  def change
    create_table :calcs do |t|
      t.string :name
      t.decimal :mass_fuel_total, :precision => 15, :scale => 10

      t.timestamps null: false
    end
  end
end
