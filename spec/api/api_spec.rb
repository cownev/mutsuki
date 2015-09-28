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
  
  # create user
  describe "PUT /api/v1/service/user/create?app_id=:app_id&app_key=:app_key&os=:os" do

    context 'succeeds to create user', autodoc: true do
      it do
         is_expected.to eq 200
	 expect(body).to have_api_response(200)
	 expect(body).to have_json_path('content/user')
	 expect(body).to have_json_type(Integer).at_path("content/user/id")
      end
    end
  end

  # show user
  describe "GET /api/v1/service/user?app_id=:app_id&app_key=:app_key&uid=:uid" do

    context 'succeeds to show user', autodoc: true do
      it do
         is_expected.to eq 200 
	 expect(body).to have_api_response(200)
      end
    end

    context 'fails to show user' do
      context 'does not exist' do
        let(:uid) {0}
        it do
           is_expected.to eq 404
	   expect(body).to have_api_response(404)
        end
      end
    end
  end

  # delete user
  describe "DELETE /api/v1/service/user/delete?app_id=:app_id&app_key=:app_key&uid=:uid" do

    context 'succeeds to delete user', autodoc: true do
      it do
         is_expected.to eq 200 
	 expect(body).to have_api_response(200)
      end
    end

    context 'fails to delete user' do
      context 'does not exist' do
        let(:uid) {0}
        it do
           is_expected.to eq 404
	   expect(body).to have_api_response(404)
        end
      end
    end
  end

  # create event
  describe "PUT /api/v1/service/user/event/create?app_id=:app_id&app_key=:app_key&uid=:uid&name=:name&date=:date&private_flg=:private_flg" do
    let(:name)        {'test-event'}
    let(:date)        {'2000-01-01'}
    let(:private_flg) {1}

    context 'succeeds to create event', autodoc: true do
      it do
         is_expected.to eq 200 
	 expect(body).to have_api_response(200)
      end
    end
  end

  # update event
  describe "PUT /api/v1/service/user/event/update?app_id=:app_id&app_key=:app_key&uid=:uid&eid=:eid&name=:name&date=:date&private_flg=:private_flg" do
    let(:name)        {'test-event'}
    let(:date)        {'2000-01-01'}
    let(:private_flg) {1}

    context 'succeeds to update event', autodoc: true do
      it do
         is_expected.to eq 200 
	 expect(body).to have_api_response(200)
      end
    end

    context 'fails to update event' do
      context 'does not exist' do
        let(:eid) {0}
        it do
           is_expected.to eq 404
	   expect(body).to have_api_response(404)
        end
      end
    end
  end

  # remove event
  describe "DELETE /api/v1/service/user/event/remove?app_id=:app_id&app_key=:app_key&uid=:uid&eid=:eid" do

    context 'succeeds to remove event', autodoc: true do
      it do
         is_expected.to eq 200
	 expect(body).to have_api_response(200)
      end
    end

    context 'fails to remove event' do
      context 'does not exist' do
        let(:eid) {0}
        it do
           is_expected.to eq 404
	   expect(body).to have_api_response(404)
        end
      end
    end
  end

  # add event
  describe "PUT /api/v1/service/user/event/add?app_id=:app_id&app_key=:app_key&uid=:uid&eid=:eid" do

    context 'succeeds to add event', autodoc: true do
      let(:eid) {@user_2.events[1].id}
      it do
         is_expected.to eq 200 
	 expect(body).to have_api_response(200)
      end
    end

    context 'fails to add event' do
      context 'dose not exist' do
        let(:eid) {0}
        it do
           is_expected.to eq 404
	   expect(body).to have_api_response(404)
        end
      end

      context 'already added to event list' do
        it do
           is_expected.to eq 409
	   expect(body).to have_api_response(409)
        end
      end
    end
  end
end
