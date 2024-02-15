class WinnerNotificationJob
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    WinnerMailer.winning_notification(user).deliver
  end
end 