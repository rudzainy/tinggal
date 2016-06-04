File.open('listings.json', 'r') do |file|
  file.each do |line|
    listing = JSON.parse line
    Listing.create! listing
  end
end

File.open('propertyCategoryType.json', 'r') do |file|
  file.each do |line|
    item = JSON.parse line
    PropertyCategoryType.create! item
  end
end

File.open('propertyGroupType.json', 'r') do |file|
  file.each do |line|
    item = JSON.parse line
    PropertyGroupType.create! item
  end
end

File.open('propertyType.json', 'r') do |file|
  file.each do |line|
    item = JSON.parse line
    PropertyType.create! item
  end
end

