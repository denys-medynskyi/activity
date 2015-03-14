class Api::GamesController < ApplicationController
  def create
    team = Game.new(teams: params[:game][:teams])
    team.save!
  end

  def turn
  end


end
