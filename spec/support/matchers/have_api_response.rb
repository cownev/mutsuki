RSpec::Matchers.define :have_api_response do |expected|
  match do |actual|
    @expected_status  = expected
    @expected_message = set_expected_message
    @actual_status, @actual_message = parse_api_header 

    expect(actual).to have_json_path('header')
    expect(actual).to be_json_eql(@expected_status).at_path('header/status')
    expect(actual).to be_json_eql(@expected_message).at_path('header/message')
  end

  failure_message do
    %(expected: { code: #{@expected_status}, message: #{@expected_message} }\n) +
    %(     got: { code: #{@actual_status}, message: "#{@actual_message}" })
  end 

  failure_message_when_negated do
    %(expected: !{ code: #{@expected_status}, message: #{@expected_message} }\n) +
    %(     got:  { code: #{@actual_status}, message: "#{@actual_message}" })
  end

  def parse_api_header 
    return JSON.parse(actual)['header']['status'],  JSON.parse(actual)['header']['message']
  end

  def set_expected_message
    case expected 
    when 200
      return '"ok"'
    when 400
      return '"some parameters are valid or some mandatory parameters are missing"'
    when 403
      return '"forbidden"'
    when 404
      return '"not found"'
    when 409
      return '"user already has specified event"'
    when 500
      return '"internal error"'
    else
      return '"unknown status code"'
    end
  end
end
