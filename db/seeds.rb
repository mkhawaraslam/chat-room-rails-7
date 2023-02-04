# frozen_string_literal: true

filepath = Rails.root.join('db/seeds/*.rb')
Dir[File.join(filepath)].sort.each do |seed|
  load seed
end
