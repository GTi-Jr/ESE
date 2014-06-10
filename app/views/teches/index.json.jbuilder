json.array!(@teches) do |tech|
  json.extract! tech, :id, :title, :description, :day, :time, :limit, :price
  json.url tech_url(tech, format: :json)
end
