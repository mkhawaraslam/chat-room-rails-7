# frozen_string_literal: true

# User model
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :messages, foreign_key: :sender_id

  has_many :conversation_members
  has_many :conversations, through: :conversation_members

  # TODO: Validation will be added.

  def full_name
    "#{first_name} #{last_name}"
  end
end
