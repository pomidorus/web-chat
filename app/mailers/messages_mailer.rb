class MessagesMailer < ApplicationMailer
  default from: 'stats@chat.com'

  def weekly_stats
    @user = params[:user]
    @stats = MessagesStatsService.new(@user)
    mail(to: @user.email, subject: 'Chat Weekly Stats')
  end
end
