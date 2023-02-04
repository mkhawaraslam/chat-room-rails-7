# frozen_string_literal: true

#
# conversation_members table migration
#
class CreateConversationMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :conversation_members do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :conversation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
