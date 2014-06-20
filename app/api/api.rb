class API < Grape::API
  format    :json
  formatter :json, Grape::Formatter::Jbuilder
  version   "v1", using: :path

  params do
    requires :id, type: Integer
  end

  resource :events do
    get "/" , jbuilder:'events' do
    #get ":id" , jbuilder:'events' do
      @user = User.find(params[:id])
    end
    get ":id" , jbuilder:'events' do
      @user = User.find(params[:id])
    end
  end

end
