# frozen_string_literal: true

conversation = Conversation.first_or_create(is_private: true)

User.find_each do |user|
  conversation_member = ConversationMember.find_or_initialize_by(user_id: user.id, conversation_id: conversation.id)
  next if conversation_member.persisted?

  conversation_member.assign_attributes(user_id: user.id, conversation_id: conversation.id)
  conversation_member.save!
end
