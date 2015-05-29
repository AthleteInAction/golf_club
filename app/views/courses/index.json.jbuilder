json.array!(@courses) do |course|
  json.extract! course, :id, :user_id, :name, :address, :city, :state, :country, :zip
  json.url course_url(course, format: :json)
end
