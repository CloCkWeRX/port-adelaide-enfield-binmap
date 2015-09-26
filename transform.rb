require 'json'

data = JSON.parse(IO.read('paewastecollectionareas.geojson'))
data["features"].each do |feature|
  props = feature["properties"].dup
  feature["properties"] = {
    "rub_day" => props["PICKUPDAY"],
    "name" => props["SUMMARY"],
    "rub_weeks" => 1
  }
end
puts data.to_json
