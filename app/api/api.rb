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
      get "auth", jbuilder:'return_header' do
        @status = 200
        @message = 'OK'
        @id = User.where(fid: params[:fid]).select(:id).limit(1)
        # @user = User.find(@id) if @id
	raise ActiveRecord::RecordNotFound if @id.blank?
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
      end
      resource :event do
        params do
          requires :name, type: String
          requires :date, type: Date
	end
        put "create", jbuilder:'user' do
          @status = 200
          @message = 'OK'

	  @user  = User.find(params[:uid])
	  raise ActiveRecord::RecordNotFound if @user.blank?

          @event = Event.create!({
	    name:            params[:name],
            date:            params[:date],
            creator_user_id: params[:uid]
          })

          @user_event = UserEvent.create!({
   	    user: @user, 
	    event: @event
          })
        end
       
        params do
          requires :eid,  type: Integer
          requires :name, type: String
          requires :date, type: Date
	end
        put "update", jbuilder:'return_header' do
          @status = 200
          @message = 'OK'

          @event = Event.find_by(id: params[:eid], creator_user_id: params[:uid])
	  raise ActiveRecord::RecordNotFound if @event.blank?
	  @event.update({
       	          name: params[:name],
                  date: params[:date]
	  })
        end

        params do
          requires :eid, type: Integer
        end
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

        params do
          requires :eid, type: Integer
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

    resource :event do
      get "list", jbuilder:'events' do
        @status = 200
        @message = 'OK'
	@events = Event.limit(10)
	#@events = Event.all
      end

      params do
        requires :uid,  type: Integer
        requires :name, type: String
        requires :date, type: Date
      end
      put "create", jbuilder:'new_event' do
        @status = 200
        @message = 'OK'
        @user = Event.create!({
  	  uid: params[:uid],
	  name: params[:name],
          date: params[:date]
        })
      end
    end
  end

  route :any, '*path' do
      error!({'header' => {'status' => '404', 'message' => 'not found'}})
  end
end
