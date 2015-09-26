require 'json'

data = JSON.parse(IO.read('paewastecollectionareas.geojson'))
data["features"].each do |feature|
  props = feature["properties"].dup
  feature["properties"] = {
    "rub_day" => props["PICKUPDAY"],
    "name" => props["SUMMARY"],
    "rub_weeks" => 1,
    "rub_start" => "2013-05-01"
  }
end

recycling_data = JSON.parse(IO.read('paerecyclingcollectionareas.geojson'))
recycling_data["features"].each do |feature|
  props = feature["properties"].dup

  feature["properties"] = {
    "rec_day" => props["PICKUPDAY"],
    "name" => props["SUMMARY"],
    "rec_weeks" => 2,
    "rec_start" => "2013-05-01",

    "grn_day" => props["PICKUPDAY"],
    "name" => props["SUMMARY"],
    "grn_weeks" => 2,
    "grn_start" => "2013-05-07",    
  }
  data["features"] << feature
end
puts data.to_json
