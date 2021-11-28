class ChatChannel < ApplicationCable::Channel
  CHAT_CHANNEL = 'ChatChannel'.freeze
  
  def subscribed
    stream_from CHAT_CHANNEL
  end

  def chat(data)
    current_user.messages.create(body: data['body'])
    ActionCable.server.broadcast(CHAT_CHANNEL, data)
  end
end