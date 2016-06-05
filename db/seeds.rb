File.open('db/listings.json', 'r') do |file|
  file.each do |line|
    listing = JSON.parse line
    Listing.create! listing
    if rand(100) % 7 == 0
    	listing.update(agent_id: "12345")
    end
    if listing.BuildingName == "" or listing.BuildingName == nil
    	listing.update(BuildingName: Faker::Address.street_name)
    end
  end
end

File.open('db/propertyCategoryType.json', 'r') do |file|
  file.each do |line|
    item = JSON.parse line
    PropertyCategoryType.create! item
  end
end

File.open('db/propertyGroupType.json', 'r') do |file|
  file.each do |line|
    item = JSON.parse line
    PropertyGroupType.create! item
  end
end

File.open('db/propertyType.json', 'r') do |file|
  file.each do |line|
    item = JSON.parse line
    PropertyType.create! item
  end
end

User.create!([
  { username: "Rudzainy",
  	email: "rudzainy@rudzainy.com",
  	password: "123456",
  	gender: "male",
  	age_range: "20-30",
  	maritial_status: "single",
  	salary: "10000",
  	user_type: "user"
  },
  { username: "Hainum",
  	email: "hainum23@hotmail.com",
  	password: "123",
  	gender: "male",
  	age_range: "20-30",
  	maritial_status: "single",
  	salary: "10000",
  	user_type: "user"
  }
])

Agent.create!([
  { agent_id: "12345", email: "tinggalapp@gmail.com" }
])

100.times do
	User.create!([
		{ username: Faker::Internet.user_name,
			email: Faker::Internet.email,
	  	password: "123456",
	  	gender: ["male", "female"].sample,
	  	age_range: "min #{rand(20..60)}",
	  	maritial_status: ["single", "married", "unknown"].sample,
	  	salary: "#{rand(10..150)}00",
	  	user_type: "user"
	  }
	])
end

User.all.each do |user|
	rand(100).times do
		ListUser.create(user_id: user.id, listing_id: rand(1000), like: [0, 1].sample)
	end
end