class API < Grape::API
  format    :json
  formatter :json, Grape::Formatter::Jbuilder
  version   "v1", using: :path

  helpers do
    def authenticate!
      auth_app = AuthorizedApp.find_by(id: params[:app_id], key: params[:app_key])
      error!('Unauthorized. Invalid or expired token.', 401) unless auth_app
    end
  end

  params do
    requires :user_id, type: Integer
    requires :app_id,  type: Integer
    requires :app_key, type: String
  end

  resource :events do
    get "/" , jbuilder:'events' do
      header 'Content-type', 'application/json; charset=utf-8'
      authenticate!
      @status = 200
      @message = 'OK'
      @user = User.find(params[:user_id])
    end
    get ":id" , jbuilder:'events' do
      @user = User.find(params[:user_id])
    end
  end

end
