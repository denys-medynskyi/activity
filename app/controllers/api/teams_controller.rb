class Api::TeamsController < ApplicationController

  def create
    team = Team.new(players: params[:team][:players])
    team.save!
  end

end
