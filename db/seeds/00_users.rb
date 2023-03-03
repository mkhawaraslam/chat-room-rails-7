# frozen_string_literal: true

puts 'Running Seeds...'
users = [
  { email: 'john.doe@example.com', first_name: 'John', last_name: 'Doe', password: 'password' },
  { email: 'khawar.aslam@example.com', first_name: 'Khawar', last_name: 'Aslam', password: 'password' }
]
users.each do |attrs|
  new_user = User.find_or_initialize_by(email: attrs[:email])
  next if new_user.persisted?

  new_user.assign_attributes(attrs)
  new_user.save!
end
