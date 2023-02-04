# frozen_string_literal: true

puts 'Running Seeds...'
users = [
  { email: 'john.doe@example.com', first_name: 'John', last_name: 'Doe', password: 'password' },
  { email: 'chris.oliver@example.com', first_name: 'Chris', last_name: 'Oliver', password: 'password' }
]
users.each do |attrs|
  new_user = User.find_or_initialize_by(email: attrs[:email])
  next if new_user.persisted?

  new_user.assign_attributes(attrs)
  new_user.save!
end
