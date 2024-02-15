100.times do |i|
  user = User.create!(
    username: "user-#{i}",
    email: "user-#{i}@example.com",
    password: "password",
  )

  20.times do
    user.guesses.create(
      latitude: rand(-90.0..90.0),
      longitude: rand(-180.0..180.0),
    )
  end
end
