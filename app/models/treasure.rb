class Treasure < ApplicationRecord
  has_many :guesses

  validates :name, presence: true
  validates :description, presence: true

  def self.current_treasure
    Rails.cache.fetch("current_treasure", expires_in: 1.hour) do
      Treasure.first
    end
  end
end
