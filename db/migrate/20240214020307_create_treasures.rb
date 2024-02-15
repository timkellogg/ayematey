class CreateTreasures < ActiveRecord::Migration[6.0]
  def change
    create_table :treasures do |t|
      t.string :name
      t.text :description
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
