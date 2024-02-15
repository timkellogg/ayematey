class AddDistanceToTreasureToGuesses < ActiveRecord::Migration[7.1]
  def change
    add_column :guesses, :distance_to_treasure, :float
  end
end
