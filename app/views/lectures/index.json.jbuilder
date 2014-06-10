json.array!(@lectures) do |lecture|
  json.extract! lecture, :id, :title, :description, :time, :day, :price
  json.url lecture_url(lecture, format: :json)
end
