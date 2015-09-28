class API < Grape::API
  format    :json
  formatter :json, Grape::Formatter::Jbuilder
  version   "v1", using: :path

  helpers do
    def authenticate!
      auth_app = AuthorizedApp.find_by(id: params[:app_id], key: params[:app_key])
      show_message(403, 'forbidden')  unless auth_app
    end

    def show_message(code = 500, message = 'internal error')
      error!({'header' => {'status' => code, 'message' => message}}) 
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    Rack::Response.new({
      header: {
        status: 404,
        message: 'not found'
      }
    }.to_json, 404, {"Content-Type" => "application/json"}).finish
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    Rack::Response.new({
      header: {
        status: 409,
        message: 'user already has specified event'
      }
    }.to_json, 409, {"Content-Type" => "application/json"}).finish
  end

  rescue_from Grape::Exceptions::ValidationErrors do |e|
    Rack::Response.new({
      header: {
        status: e.status,
        message: 'some parameters are valid or some mandatory parameters are missing'
      }
    }.to_json, e.status, {"Content-Type" => "application/json"}).finish
  end

  rescue_from :all do |e|
    Rack::Response.new({
      header: {
        status: 500,
	message: 'internal error'
        #message: e.message
      }
    }.to_json, 500, {"Content-Type" => "application/json"}).finish
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
	optional :os, type: String
      end
      put "create", jbuilder:'new_user' do
        @status = 200
        @message = 'OK'
        @user = User.create!({
   	  os: params[:os]
        })
      end

      params do
        requires :uid,   type: Integer
	optional :efrom, type: Date,   default: -> { '1986-01-01' }
      end
      get "/", jbuilder:'show_user' do
        @status = 200
        @message = 'OK'
        @user = User.find(params[:uid])
	@events = @user.events.where("date >= ?", params[:efrom]).order(date: :asc, id: :asc)
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
          requires :name,        type: String
          requires :date,        type: Date
          optional :private_flg, type: Integer, default: 1, values: [0, 1]
	end
        put "create", jbuilder:'return_header' do
          @status = 200
          @message = 'OK'

	  @user  = User.find(params[:uid])
	  raise ActiveRecord::RecordNotFound if @user.blank?

          @event = Event.create!({
	    name:            params[:name],
            date:            params[:date],
            private_flg:     params[:private_flg],
            creator_user_id: params[:uid]
          })

          @user_event = UserEvent.create!({
   	    user: @user, 
	    event: @event
          })
        end
       
        params do
          requires :eid,         type: Integer
          requires :name,        type: String
          requires :date,        type: Date
          requires :private_flg, type: Integer, values: [0, 1]
	end
        put "update", jbuilder:'return_header' do
          @status = 200
          @message = 'OK'

          @event = Event.find_by(id: params[:eid], creator_user_id: params[:uid])
	  raise ActiveRecord::RecordNotFound if @event.blank?
	  @event.update({
       	          name:        params[:name],
                  date:        params[:date],
                  private_flg: params[:private_flg],
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
    show_message(404, 'not found')
  end
end
