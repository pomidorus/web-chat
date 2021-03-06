require 'rails_helper'

RSpec.describe 'MessagesStatsService' do
  let(:user) { create(:user) }
  let!(:user_b) { create(:user, email: 'user_b@gmail.com') }

  let!(:message_01) { create(:message, id: 2, user: user, created_at: 1.day.ago) }
  let!(:message_02) { create(:message, id: 1, user: user, created_at: 2.weeks.ago) }
  let!(:message_03) { create(:message, id: 3, user: user_b) }
  let!(:message_04) { create(:message, id: 4, user: user_b) }

  context 'when user has no messages' do
    let(:user_a) { create(:user, email: 'user_a@gmail.com') }

    it 'returns correct weekly count' do
      expect(MessagesStatsService.new(user_a).weekly_count).to eq 0
    end

    it 'returns correct missed count' do
      expect(MessagesStatsService.new(user_a).missed_count).to eq 0
    end
  end

  context 'when user has messages' do
    let!(:message_05) { create(:message, id: 5, user: user) }

    it 'returns correct last message day' do
      expect(MessagesStatsService.new(user).last_message_date).to eq Date.today.strftime('%dnd of %B')
    end
  end


  context 'when user has messages' do
    it 'returns correct weekly count' do
      expect(MessagesStatsService.new(user).weekly_count).to eq 1
    end

    it 'returns correct missed count' do
      expect(MessagesStatsService.new(user).missed_count).to eq 2
    end
  end
end
