# app/mailers/winner_mailer.rb
class WinnerMailer < ApplicationMailer
  default from: 'notifications@ayematey.com'

  def winning_notification(user)
    @user = user
    @greeting = "Congratulations!"

    mail to: user.email, subject: 'You found the treasure!'
  end
end
