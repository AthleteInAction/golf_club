json.array!(@teetimes) do |teetime|
  json.extract! teetime, :id, :user_id, :event_id, :course_id, :golfer_id, :teetime
  json.url teetime_url(teetime, format: :json)
end
