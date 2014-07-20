class API < Grape::API
  format    :json
  formatter :json, Grape::Formatter::Jbuilder
  version   "v1", using: :path

  helpers do
    def authenticate!
      auth_app = AuthorizedApp.find_by(id: params[:app_id], key: params[:app_key])
      error!({'header' => {'status' => '401', 'message' => 'Unauthorized. Invalid or expired token'}}) unless auth_app
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    Rack::Response.new({
      header: {
        status: 404,
        message: e.message
      }
    }.to_json, 404).finish
  end

  rescue_from Grape::Exceptions::ValidationErrors do |e|
    Rack::Response.new({
      header: {
        status: e.status,
        message: 'some mandatory parameters are missing'
      }
    }.to_json, e.status).finish
  end

  rescue_from :all do |e|
    Rack::Response.new({
      header: {
        status: 500,
        message: e.message
	#message: 'internal error'
      }
    }.to_json, 500).finish
  end

  after_validation do
    authenticate!
  end
  
  params do
    requires :app_id,  type: Integer
    requires :app_key, type: String
  end

  resource :service do

    resource :users do
      params do
        requires :name,     type: String
        requires :birthday, type: Date
      end

      put "create", jbuilder:'new_user' do
        @status = 200
        @message = 'OK'
        @user = User.create!({
   	  name: params[:name],
          birthday: params[:birthday]
        })
      end
    end

    resource :events do
      params do
        requires :user_id, type: Integer
      end
      get "/", jbuilder:'events' do
        @status = 200
        @message = 'OK'
        @user = User.find(params[:user_id])
      end

      get ":id", jbuilder:'events' do
        @user = User.find(params[:user_id])
      end

      params do
        requires :user_id, type: Integer
        requires :name,    type: String
        requires :date,    type: Date
      end
      put "create", jbuilder:'new_event' do
        @status = 200
        @message = 'OK'
        @user = Event.create!({
  	  name: params[:user_id],
	  name: params[:name],
          date: params[:date]
        })
      end
    end
  end
end
