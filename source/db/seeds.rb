# frozen_string_literal: true

Zyra
  .register(User, find_by: :email)
  .on(:build) { |user| user.password = SecureRandom.hex(10) }

Zyra.find_or_create(
  :user,
  email: 'email@srv.com',
  login: 'user',
  name: 'user',
  password: '123456'
)
