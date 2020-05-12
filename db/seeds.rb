yopmails = ["he@yopmail.com", "testdefail@yopmail.com"]
cities = [ "Saint-Rapahël", "Paris", "Marseille", "Lyon", "La Vallette", "Rome", "Deauville"]

User.destroy_all
Event.destroy_all
Attendance.destroy_all

users = []
events = []

3.times do |i|
    users << User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        description: Faker::Lorem.paragraphs,
        password: "testmdp"
        
    )
    
end

6.times do |i|
    events << Event.create!(
        start_date: Time.parse("2020-08-12"),
        duration: 5 * rand(1..100),
        title: Faker::DcComics.title,
        description: Faker::Lorem.paragraphs,
        price: rand(1..300),
        location: cities.sample,
        admin: User.last
    )
    
end

6.times do |i|
    attendance = Attendance.create!(
        user: users.sample,
        event: events.sample
    )

end 
