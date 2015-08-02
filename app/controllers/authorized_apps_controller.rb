class AuthorizedAppsController < ApplicationController
  before_action :set_authorized_app, only: [:show, :edit, :update, :destroy]

  # GET /authorized_apps
  # GET /authorized_apps.json
  def index
    @authorized_apps = AuthorizedApp.page(params[:page])
  end

  # GET /authorized_apps/1
  # GET /authorized_apps/1.json
  def show
  end

  # GET /authorized_apps/new
  def new
    @authorized_app = AuthorizedApp.new
  end

  # GET /authorized_apps/1/edit
  def edit
  end

  # POST /authorized_apps
  # POST /authorized_apps.json
  def create
    @authorized_app = AuthorizedApp.new(authorized_app_params)

    respond_to do |format|
      if @authorized_app.save
        format.html { redirect_to @authorized_app, notice: 'Authorized app was successfully created.' }
        format.json { render action: 'show', status: :created, location: @authorized_app }
      else
        format.html { render action: 'new' }
        format.json { render json: @authorized_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authorized_apps/1
  # PATCH/PUT /authorized_apps/1.json
  def update
    respond_to do |format|
      if @authorized_app.update(update_authorized_app_params)
        format.html { redirect_to @authorized_app, notice: 'Authorized app was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @authorized_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authorized_apps/1
  # DELETE /authorized_apps/1.json
  def destroy
    @authorized_app.destroy
    respond_to do |format|
      format.html { redirect_to authorized_apps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorized_app
      @authorized_app = AuthorizedApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authorized_app_params
      params['authorized_app']['key'] = SecureRandom.hex(8)
      params.require(:authorized_app).permit(:name, :key)
    end

    def update_authorized_app_params
      params.require(:authorized_app).permit(:name, :key)
    end
end
