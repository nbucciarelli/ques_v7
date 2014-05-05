task create_people: :environment do
  100.times do |people|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    Que.create( {name: "#{first_name} #{last_name}", email: "#{first_name}.#{last_name}@gmail.com" } )
  end
end