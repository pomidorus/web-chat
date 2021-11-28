class ChatChannel < ApplicationCable::Channel
  CHAT_CHANNEL = 'ChatChannel'.freeze
  
  def subscribed
    stream_from CHAT_CHANNEL
  end

  def chat(data)
    ActionCable.server.broadcast(CHAT_CHANNEL, data)
  end
end