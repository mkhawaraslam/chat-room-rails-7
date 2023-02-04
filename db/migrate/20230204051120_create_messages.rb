# frozen_string_literal: true

#
# messages table migration
#
class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.belongs_to :sender, null: false, foreign_key: { to_table: :users }
      t.belongs_to :conversation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
