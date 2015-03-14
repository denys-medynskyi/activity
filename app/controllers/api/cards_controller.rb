class Api::CardsController < Api::ApplicationController
  def create
    card = Card.new(permitted_params)
    card.save!
  end

  def update
    card = Card.find(params[:id])
    card.update!(permitted_params)
  end

  def destroy
    card = Card.find(params[:id])
    Card.delete_all(id: params[:id])
  end

  def permitted_params
    params.require(:card).permit(:word, :difficulty, :type)
  end
end
