class GuessesController < ApplicationController
  before_action :authenticate_user!

  def index
    @guesses = current_user.guesses.page(params[:page]).per(10)
  end

  def new
    @guess = Guess.new
    @current_treasure = Treasure.current_treasure
    @has_won = current_user.has_won?
  end

  def create
    @guess = current_user.guesses.build(guess_params)
  
    if @guess.save
      if @guess.winner?
        WinnerNotificationJob.perform_async(current_user.id)
        redirect_to new_user_guess_path(current_user), notice: "You won!"
      else
        redirect_to new_user_guess_path(current_user), notice: "Not the treasure!"
      end
    else
      render :new
    end
  end

  private

  def guess_params
    params.require(:guess).permit(:latitude, :longitude)
  end
end
