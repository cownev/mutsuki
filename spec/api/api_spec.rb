require 'rails_helper'

describe API, type: :request  do

  before(:all) do
    @app    = FactoryGirl.create(:authorized_app)
    @user_1 = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user)
  end

  let(:app_id)  {@app.id}
  let(:app_key) {@app.key}
  let(:uid)     {@user_1.id}
  let(:os)      {@user_1.os}
  let(:eid)     {@user_1.events[1].id}

  # ping to keep alive
  describe "GET /api/v1/ping" do

    context 'succeeds to ping', autodoc: true do
      it  do
        is_expected.to eq 200
        expect(response.headers).to include("Content-Type" => "application/json")
        expect(body).to have_api_header(200)
      end
    end
  end
  
  # create user
  describe "PUT /api/v1/service/user/create?app_id=:app_id&app_key=:app_key" do

    before do
      @user_count = User.count
    end
    context 'succeeds to create user' do
      it  do 
         is_expected.to eq 200
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(200)
	 expect(body).to have_api_user
	 expect(User.count).to eq(@user_count+1)
      end
    end
  end

  # create user (with os parameter)
  describe "PUT /api/v1/service/user/create?app_id=:app_id&app_key=:app_key&os=:os" do

    before do
      @user_count = User.count
    end
    context 'succeeds to create user', autodoc: true do
      it do
         is_expected.to eq 200
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(200)
	 expect(body).to have_api_user
	 expect(User.count).to eq(@user_count+1)
      end
    end
  end

  # show user (with efrom parameter) 
  describe "GET /api/v1/service/user?app_id=:app_id&app_key=:app_key&uid=:uid&efrom=:efrom" do

    context 'succeeds to show user', autodoc: true do
      let(:efrom) {'2013-01-01'}
      it do
         is_expected.to eq 200 
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(200)
	 expect(body).to have_api_user

	 # user
	 expect(body).to be_json_eql(uid).at_path('content/user/id')
	 expect(body).to have_api_events().count(1)

	 # event 3 
	 expect(body).to be_json_eql(@user_1.events[2].id).at_path('content/events/0/id')
	 expect(body).to be_json_eql(%("#{@user_1.events[2].name}")).at_path('content/events/0/name')
	 expect(body).to be_json_eql(%("#{@user_1.events[2].date}")).at_path('content/events/0/date')
	 expect(body).to be_json_eql(@user_1.events[2].creator_user_id).at_path('content/events/0/creator_user_id')
	 expect(body).to be_json_eql((@user_1.events[2].private_flg ? 1 : 0)).at_path('content/events/0/private_flg')
      end
    end
  end

  # show user
  describe "GET /api/v1/service/user?app_id=:app_id&app_key=:app_key&uid=:uid" do

    context 'succeeds to show user' do
      it do
         is_expected.to eq 200 
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(200)
	 expect(body).to have_api_user

	 # user
	 expect(body).to be_json_eql(uid).at_path('content/user/id')
	 expect(body).to have_api_events().count(3)

	 # event 1
	 expect(body).to be_json_eql(@user_1.events[0].id).at_path('content/events/0/id')
	 expect(body).to be_json_eql(%("#{@user_1.events[0].name}")).at_path('content/events/0/name')
	 expect(body).to be_json_eql(%("#{@user_1.events[0].date}")).at_path('content/events/0/date')
	 expect(body).to be_json_eql(@user_1.events[0].creator_user_id).at_path('content/events/0/creator_user_id')
	 expect(body).to be_json_eql((@user_1.events[0].private_flg ? 1 : 0)).at_path('content/events/0/private_flg')

         # event 2 
	 expect(body).to be_json_eql(@user_1.events[1].id).at_path('content/events/1/id')
	 expect(body).to be_json_eql(%("#{@user_1.events[1].name}")).at_path('content/events/1/name')
	 expect(body).to be_json_eql(%("#{@user_1.events[1].date}")).at_path('content/events/1/date')
	 expect(body).to be_json_eql(@user_1.events[1].creator_user_id).at_path('content/events/1/creator_user_id')
	 expect(body).to be_json_eql((@user_1.events[1].private_flg ? 1 : 0)).at_path('content/events/1/private_flg')
	 
	 # event 3
	 expect(body).to be_json_eql(@user_1.events[2].id).at_path('content/events/2/id')
	 expect(body).to be_json_eql(%("#{@user_1.events[2].name}")).at_path('content/events/2/name')
	 expect(body).to be_json_eql(%("#{@user_1.events[2].date}")).at_path('content/events/2/date')
	 expect(body).to be_json_eql(@user_1.events[2].creator_user_id).at_path('content/events/2/creator_user_id')
	 expect(body).to be_json_eql((@user_1.events[2].private_flg ? 1 : 0)).at_path('content/events/2/private_flg')
      end
    end

    context 'fails to show user' do
      context 'does not exist' do
        let(:uid) {0}
        it do
           is_expected.to eq 404
	   expect(response.headers).to include("Content-Type" => "application/json")
	   expect(body).to have_api_header(404)
	   expect(body).not_to have_json_path('content')
        end
      end
    end
  end

  # delete user
  describe "DELETE /api/v1/service/user/delete?app_id=:app_id&app_key=:app_key&uid=:uid" do

    before do
      @user_count = User.count
    end
    context 'succeeds to delete user', autodoc: true do
      it do
         is_expected.to eq 200 
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(200)
	 expect(body).not_to have_json_path('content')
	 expect(User.count).to eq(@user_count-1)
	 expect(User.where(id: uid)).not_to be_present
      end
    end

    context 'fails to delete user' do
      context 'does not exist' do
        let(:uid) {0}
        it do
           is_expected.to eq 404
	   expect(response.headers).to include("Content-Type" => "application/json")
	   expect(body).to have_api_header(404)
	   expect(body).not_to have_json_path('content')
        end
      end
    end
  end

  # create event (with private_flg parameter)
  describe "PUT /api/v1/service/user/event/create?app_id=:app_id&app_key=:app_key&uid=:uid&name=:name&date=:date&private_flg=:private_flg" do
    let(:name)        {'test-event'}
    let(:date)        {'2000-01-01'}
    let(:private_flg) {0}

    before do
      @event_count      = Event.count
      @user_event_count = UserEvent.count
    end
    context 'succeeds to create event', autodoc: true do
      it do
         is_expected.to eq 200 
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(200)
	 expect(body).not_to have_json_path('content')
	 expect(Event.count).to eq(@event_count+1)
	 expect(Event.where(name: "test-event", date: '2000-01-01', creator_user_id: uid, private_flg: false)).to be_present
	 expect(UserEvent.count).to eq(@user_event_count+1)
      end
    end
  end

  # create event
  describe "PUT /api/v1/service/user/event/create?app_id=:app_id&app_key=:app_key&uid=:uid&name=:name&date=:date" do
    let(:name)        {'test-event'}
    let(:date)        {'2000-01-01'}

    before do
      @event_count      = Event.count
      @user_event_count = UserEvent.count
    end
    context 'succeeds to create event' do
      it do
         is_expected.to eq 200 
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(200)
	 expect(body).not_to have_json_path('content')
	 expect(Event.count).to eq(@event_count+1)
	 expect(Event.where(name: "test-event", date: '2000-01-01', creator_user_id: uid, private_flg: true)).to be_present
	 expect(UserEvent.count).to eq(@user_event_count+1)
      end
    end
  end

  # update event
  describe "PUT /api/v1/service/user/event/update?app_id=:app_id&app_key=:app_key&uid=:uid&eid=:eid&name=:name&date=:date&private_flg=:private_flg" do
    let(:name)        {'test-event'}
    let(:date)        {'2000-01-01'}
    let(:private_flg) {0}

    context 'succeeds to update event', autodoc: true do
      it do
         is_expected.to eq 200 
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(200)
	 expect(body).not_to have_json_path('content')
	 expect(Event.where(id: eid, name: "test-event", date: '2000-01-01', creator_user_id: uid, private_flg: false)).to be_present
      end
    end

    context 'fails to update event' do
      context 'does not exist' do
        let(:eid) {0}
        it do
           is_expected.to eq 404
	   expect(response.headers).to include("Content-Type" => "application/json")
	   expect(body).to have_api_header(404)
	   expect(body).not_to have_json_path('content')
        end
      end
    end
  end

  # remove event
  describe "DELETE /api/v1/service/user/event/remove?app_id=:app_id&app_key=:app_key&uid=:uid&eid=:eid" do

    before do
      @event_count      = Event.count
      @user_event_count = UserEvent.count
    end
    context 'succeeds to remove event', autodoc: true do
      it do
         is_expected.to eq 200
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(200)
	 expect(body).not_to have_json_path('content')
	 expect(Event.count).to eq(@event_count)
	 expect(Event.where(id: eid)).to be_present
	 expect(UserEvent.count).to eq(@user_event_count-1)
	 expect(UserEvent.where(user_id: uid, event_id: eid)).not_to be_present
      end
    end

    context 'fails to remove event' do
      context 'does not exist' do
        let(:eid) {0}
        it do
           is_expected.to eq 404
	   expect(response.headers).to include("Content-Type" => "application/json")
	   expect(body).to have_api_header(404)
	   expect(body).not_to have_json_path('content')
        end
      end
    end
  end

  # add event
  describe "PUT /api/v1/service/user/event/add?app_id=:app_id&app_key=:app_key&uid=:uid&eid=:eid" do

    before do
      @user_event_count = UserEvent.count
    end
    context 'succeeds to add event', autodoc: true do
      let(:eid) {@user_2.events[1].id}
      it do
         is_expected.to eq 200 
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(200)
	 expect(body).not_to have_json_path('content')
	 expect(UserEvent.count).to eq(@user_event_count+1)
	 expect(UserEvent.where(user_id: uid, event_id: eid)).to be_present
      end
    end

    context 'fails to add event' do
      context 'dose not exist' do
        let(:eid) {0}
        it do
           is_expected.to eq 404
	   expect(response.headers).to include("Content-Type" => "application/json")
	   expect(body).to have_api_header(404)
	   expect(body).not_to have_json_path('content')
        end
      end

      context 'already added to event list' do
        it do
           is_expected.to eq 409
	   expect(response.headers).to include("Content-Type" => "application/json")
	   expect(body).to have_api_header(409)
	   expect(body).not_to have_json_path('content')
        end
      end
    end
  end

  # [error] set wrong http method
  describe "PUT /api/v1/service/user?app_id=:app_id&app_key=:app_key&uid=:uid" do

    context 'returns 404 response' do
      it do
         is_expected.to eq 404 
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(404)
	 expect(body).not_to have_json_path('content')
      end
    end
  end

  # [error] fail authentication 
  describe "GET /api/v1/service/user?app_id=:app_id&app_key=:app_key&uid=:uid" do
    let(:app_key) {'wrong_key'}

    context 'returns 403 response' do
      it do
         is_expected.to eq 403 
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(403)
	 expect(body).not_to have_json_path('content')
      end
    end
  end

  # [error] access not found path
  describe "GET /api/v1/service/test?app_id=:app_id&app_key=:app_key&uid=:uid" do

    context 'returns 404 response' do
      it do
         is_expected.to eq 404
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(404)
	 expect(body).not_to have_json_path('content')
      end
    end
  end

  # [error] miss some mandatory parameters
  describe "GET /api/v1/service/user?app_id=:app_id&app_key=:app_key" do

    context 'returns 400 response' do
      it do
         is_expected.to eq 400
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(400)
	 expect(body).not_to have_json_path('content')
      end
    end
  end

  # [error] set invalid parameter
  describe "GET /api/v1/service/user?app_id=:app_id&app_key=:app_key&user:uid" do
    let(:uid) {'invalid_uid'}

    context 'returns 400 response' do
      it do
         is_expected.to eq 400
	 expect(response.headers).to include("Content-Type" => "application/json")
	 expect(body).to have_api_header(400)
	 expect(body).not_to have_json_path('content')
      end
    end
  end
end
