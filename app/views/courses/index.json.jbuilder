json.array!(@courses) do |course|
  json.extract! course, :id, :title, :description, :time, :day, :limit, :price
  json.url course_url(course, format: :json)
end
