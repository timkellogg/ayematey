class AddFirstTreasure < ActiveRecord::Migration[7.1]
  def up
    Treasure.create!(
      name: "Gold",
      description: "Chest of Gold",
      latitude: 15,
      longitude: -75,
    )
  end

  def down
    Treasure.find_by(name: "Gold", description: "Chest of Gold").destroy!
  end
end
