class MessagesStats
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def weekly_count
    user.messages.where('created_at > ?', 1.week.ago).count
  end

  def missed_count
    last_message ? Message.where('id > ?', last_message.id).count : 0
  end

  def last_message
    @last_message ||= user.messages.order('created_at DESC').first
  end
end
