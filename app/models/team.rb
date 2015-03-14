class Team < ActiveRecord::Base
  validates :name, presence: true, length: 1..50
  validate :players_presence

  private

  def players_presence
    errors.add :players, "Players can't be empty" if players.values.any? {|p| p.blank?}
  end
end
