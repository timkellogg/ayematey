class AddIndexToWinnerInGuesses < ActiveRecord::Migration[7.1]
  def change
    add_index :guesses, :winner
  end
end
