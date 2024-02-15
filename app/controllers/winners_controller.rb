class WinnersController < ApplicationController
  before_action :authenticate_user!

  def index
    @winners = Guess.winners(page: params[:page], per: params[:per])
  end
end
