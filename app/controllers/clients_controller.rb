class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action  :set_auth_user_id, only: [:index, :create, :update]
  skip_before_action :verify_authenticity_token, :only => [:index, :create, :update, :destroy]

  # GET /clients
  def index
    puts @user_id
    @clients = Client.find_by user_id: @user_id

    render json: @clients

  end

  # GET /clients/:id
  def show
  end


  # POST /clients
  def create
    # puts client_params
    # @client = Client.new(client_params)

    @client = Client.new(client_params)
      # @client.firstName = client_params[:firstName]
      # @client.lastName = client_params[:lastName]
      # @client.email = client_params[:email]
      # @client.phone = client_params[:phone]
      # @client.gender = client_params[:gender]
      @client.user_id = @user_id

    respond_to do |format|
      if @client.save
        format.json { render json :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/:id
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.json { render :show, status: :ok, location: @client }
      else
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/:id
  def destroy
    @client.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end


    # GET user_id from token
    def set_auth_user_id
      if request.headers['x-auth-token'].present?
        @token = request.headers['x-auth-token']
        puts @token + " TOKEN"
        @decoded = JsonWebToken.decode(@token)
        puts @decoded + " id"
        # @user_id = @decoded[0]['user']['id']
       else
        render json: { msg: "Token is not valid" }, status: :unauthorized
      end
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.permit(:firstName, :lastName, :email, :phone, :gender )
    end
end
