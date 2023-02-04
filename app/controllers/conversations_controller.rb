# frozen_string_literal: true

# Handle conversation messages
#
class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
