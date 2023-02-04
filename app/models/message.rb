# frozen_string_literal: true

# Message model
#
class Message < ApplicationRecord
  include BroadcastCallbacksConcern

  belongs_to :sender, class_name: 'User'
  belongs_to :conversation

  validates :content, presence: true

  def message_display_class(user:)
    sender_id == user.id ? 'from-me' : 'from-them'
  end

  def receiver
    ConversationMember
      .where(conversation_id: sender.conversations.pluck(:id))
      .receivers(user_id: sender.id)
      .last
  end
end
