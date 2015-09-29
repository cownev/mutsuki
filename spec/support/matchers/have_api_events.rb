RSpec::Matchers.define :have_api_events do |expected|
  match do |actual|
    expect(actual).to have_json_path('content/events')

    for num in 0..@count
      expect(actual).to have_json_path("content/events/#{num}/id")
      expect(actual).to have_json_type(Integer).at_path("content/events/#{num}/id")
      expect(actual).to have_json_path("content/events/#{num}/name")
      expect(actual).to have_json_type(String).at_path("content/events/#{num}/name")
      expect(actual).to have_json_path("content/events/#{num}/date")
      expect(actual).to have_json_type(String).at_path("content/events/#{num}/date")
      expect(actual).to have_json_path("content/events/#{num}/creator_user_id")
      expect(actual).to have_json_type(Integer).at_path("content/events/#{num}/creator_user_id")
      expect(actual).to have_json_path("content/events/#{num}/private_flg")
      expect(actual).to have_json_type(Integer).at_path("content/events/#{num}/private_flg")
    end
  end

  failure_message do
    events = JSON.parse(actual)['content']['events'].to_json 
    if events != 'null'
	    events = "{\"events\": #{events}}"
    end

    %(expected: {"events": [{"id": <int>, "name": "<string>", "date": "<string>", "creator_user_id": <int>, "private_flg": <int>}]}\n) +
    %(     got: #{events} )
  end 

  chain :count do |count|
    @count = count - 1
  end
end
