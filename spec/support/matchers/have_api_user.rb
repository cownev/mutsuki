RSpec::Matchers.define :have_api_user do |expected|
  match do |actual|
    expect(actual).to have_json_path('content/user')
    expect(actual).to have_json_path('content/user/id')
    expect(actual).to have_json_type(Integer).at_path('content/user/id')
  end

  failure_message do
    user = JSON.parse(actual)['content']['user'].to_json
    if user != 'null'
      user= "{\"user\": #{user}}"
    end
    %(expected: {"user": {"id": <int>}}\n) +
    %(     got: #{user} )
  end 
end
