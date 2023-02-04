# frozen_string_literal: true

# Conversation Member model
#
class ConversationMember < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  # TODO: Handle this method
  def self.receivers(user_id:)
    where.not(user_id:)
  end
end
