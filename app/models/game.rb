class Game < ActiveRecord::Base
  validates :teams, presence: true
  validate :team_name_cant_be_blank
  validate :team_player_cant_be_blank
  validate :team_count
  # [{team: 'A' , players: ['den', 'bond'], current_player: 0}, current_team: 0]
  private

  def team_count
    errors.add :teams, "Team count should be more than 2" if teams.count < 2
  end

  def team_name_cant_be_blank
    self.teams.each do |team|
      errors.add :teams, "Team name cant be blank" if team['name'].blank?
    end
  end

  def team_player_cant_be_blank
    self.teams.each do |team|
      errors.add :teams, "Team player name cant be blank" if team['players'].any? {|player| player.blank?}
    end
  end
end
