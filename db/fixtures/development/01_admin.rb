User.seed do |u|
  u.email = "admin@example.com"
  u.password = "1234"
  u.password_confirmation = "1234"
  u.admin = true
end
puts <<-END
Created admin user
Email: #{User.admins.first.email}
Password: 1234
END
