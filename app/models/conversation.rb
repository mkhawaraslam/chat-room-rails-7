# frozen_string_literal: true

# Conversation model
#
class Conversation < ApplicationRecord
  has_many :conversation_members, dependent: :destroy
  has_many :messages, dependent: :destroy

  # NOTE: We can manage this method for multiple / group chat too
  def self.with(receiver_id:)
    joins(:conversation_members)
      .where(conversation_members: { user_id: receiver_id })
      .distinct
      .first
  end
end
