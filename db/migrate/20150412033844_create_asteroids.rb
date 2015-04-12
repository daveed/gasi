class CreateAsteroids < ActiveRecord::Migration
  def change
    create_table :asteroids do |t|
      t.decimal :mass, :precision => 15, :scale => 10

      t.timestamps null: false
    end
  end
end
