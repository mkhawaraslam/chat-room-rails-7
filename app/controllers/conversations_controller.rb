# frozen_string_literal: true

# Handle conversation messages
#
class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_conversation, only: %i[update show]

  # TODO:
    # - Implement Infinite backward scroll with pagination for big chats
    # - Add specs
    # - Double check data model, to simply implementation
    # - Fix the auto scroll-down

  def index
    @receiver_members =
      ConversationMember
        .where(conversation_id: current_user.conversations.pluck(:id))
        .receivers(user_id: current_user.id)
  end

  def show; end

  def update
    @message = @conversation.messages.new(message_params)
    return unless @message.valid?

    @message.save
  end

  private

  def message_params
    permitted_params = params.require(:message).permit(:content, :sender_id)
    permitted_params[:sender_id] = current_user.id
    permitted_params
  end

  def find_conversation
    @conversation = current_user.conversations.find(params[:id])
  end
end
