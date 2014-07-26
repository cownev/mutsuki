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
        message: 'not found'
        #message: e.message
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

    resource :user do
      params do
        requires :fid, type: String
      end
      put "create", jbuilder:'new_user' do
        @status = 200
        @message = 'OK'
        @user = User.create!({
   	  fid: params[:fid]
        })
      end

      params do
        requires :fid, type: String
      end
      get "auth", jbuilder:'user' do
        @status = 200
        @message = 'OK'
        @id = User.where(fid: params[:fid]).select(:id).limit(1)
        @user = User.find(@id) if @id
      end

      params do
        requires :uid, type: Integer
      end
      get "/", jbuilder:'user' do
        @status = 200
        @message = 'OK'
        @user = User.find(params[:uid])
      end

      params do
        requires :uid, type: Integer
      end
      delete "delete", jbuilder:'return_header' do
        @status = 200
        @message = 'OK'
        @user = User.find(params[:uid]).destroy
      end

      params do
        requires :uid, type: Integer 
        requires :eid, type: Integer
      end
      resource :event do
        put "add", jbuilder:'return_header' do
          @status = 200
          @message = 'OK'
	  @user  = User.find(params[:uid])
	  @event = Event.find(params[:eid])
          @user_event = UserEvent.create!({
   	    user: @user, 
	    event: @event
          })
        end
        delete "remove", jbuilder:'return_header' do
          @status = 200
          @message = 'OK'
          @user_event = UserEvent.find_by(user_id: params[:uid], event_id: params[:eid])
	  raise ActiveRecord::RecordNotFound if @user_event.blank?
	  @user_event.destroy
        end
      end
    end

    params do
      requires :uid, type: Integer
    end
    resource :events do
      get "list", jbuilder:'events' do
        @status = 200
        @message = 'OK'
        @user = User.find(params[:user_id])
      end

      params do
        requires :name, type: String
        requires :date, type: Date
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
