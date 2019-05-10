User.destroy_all
User.reset_pk_sequence

Event.destroy_all
Event.reset_pk_sequence

Attendance.destroy_all
Attendance.reset_pk_sequence

10.times do
  my_user = User.create!(email: Faker::Name.first_name + "@yopmail.com", encrypted_password: "foobar", description: Faker::TvShows::RickAndMorty.quote, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "foobar", is_admin: nil)
end
puts "Users created!"

10.times do
  my_event = Event.create!(start_date: Faker::Date.forward(50), duration: 5, title: Faker::Book.title, description: Faker::TvShows::SiliconValley.quote, price: rand(1..1000), location: Faker::Address.city, admin: User.all[rand(0..9)], validated: nil)
end
puts "Events created!"

10.times do
  my_attendance = Attendance.create!(stripe_customer_id: rand(1000..9999), participant: User.all[rand(0..9)], event: Event.all[rand(0..9)])
end
puts "Attendances created!"