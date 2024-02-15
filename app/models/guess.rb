# app/models/guess.rb
class Guess < ApplicationRecord
  belongs_to :user
  belongs_to :treasure, optional: true

  before_save :set_winner
  before_save :set_current_treasure

  validate :user_has_not_already_won, on: :create

  DIST_TO_WIN = 1000
  DEFAULT_PER = 20

  def self.winners(page:, per: DEFAULT_PER)
    where(winner: true)
      .includes(:user, :treasure)
      .order(:distance_to_treasure)
      .page(page).per(per)
  end

  def distance_to_treasure
    self.distance_to_treasure = Geocoder::Calculations.distance_between(
      [latitude, longitude],
      [Treasure.current_treasure.latitude, Treasure.current_treasure.longitude],
      units: :km
    )
  end

  private

  def user_has_not_already_won
    existing_winning_guess = Guess.where(user: user, treasure: Treasure.current_treasure, winner: true).exists?

    if existing_winning_guess
      errors.add(:base, "You have already made a winning guess for this treasure.")
    end
  end

  def set_winner
    self.winner = treasure_within_range?
  end

  def set_current_treasure
    self.treasure = Treasure.current_treasure
  end

  def treasure_within_range?
    self.distance_to_treasure < DIST_TO_WIN
  end
end
