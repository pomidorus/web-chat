class WeeklyStatEmailWorker
  include Sidekiq::Worker

  def perform(*args)
    User.all.each { |user| MessagesMailer.with(user: user).weekly_stats.deliver_later }
  end
end
