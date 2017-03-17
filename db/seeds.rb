json = File.expand_path(File.join(File.dirname(__FILE__), '/seeds/dogs.json'))
data = File.open(json, "r")
breed = JSON.load(data)
breed.each do |item|
  Breed.create(name: item['name'])
end
