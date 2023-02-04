# frozen_string_literal: true

# Helper methods for the message broadcast
#
module BroadcastCallbacksConcern
  extend ActiveSupport::Concern
  include ActionView::RecordIdentifier

  included do
    after_create_commit :broadcast_to_conversation
  end

  private

  # NOTE: Downside of this solution is if we go for multiple groups with multiple users
  # a lot of channels will open.
  # TODO: Consider the solution of previous commit.
  # https://github.com/jsecretan/maven-sohair/commit/feb3b1c5c83cf390a7e61d9f662a77ed00a51a7f
  def broadcast_to_conversation
    broadcast_conversation_to_sender!
    broadcast_conversation_to_receiver!
  end

  def broadcast_conversation_to_sender!
    channel = dom_id(conversation, "user_#{sender.id}")
    broadcast_append_later_to(
      channel,
      target: dom_id(conversation),
      partial: 'conversations/message',
      locals: { message: self, user: sender }
    )
  end

  def broadcast_conversation_to_receiver!
    channel = dom_id(conversation, "user_#{receiver.id}")
    broadcast_append_later_to(
      channel,
      target: dom_id(conversation),
      partial: 'conversations/message',
      locals: { message: self, user: receiver }
    )
  end
end
