File.open('db/listings.json', 'r') do |file|
  file.each do |line|
    listing = JSON.parse line
    Listing.create! listing
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
  { username: "Rudzainy", email: "rudzainy@rudzainy.com", password: "123456", gender: "male", age_range: "20-30", maritial_status: "single", salary: "10000", user_type: "user" }
])

Agent.create!([
  { agent_id: "12345", email: "tinggalapp@gmail.com" }
])