class ClientsController < ApplicationController
  # before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :get_user_token, only: [:index, :create, :update]
  skip_before_action :verify_authenticity_token, :only => [:index, :create, :update, :destroy]

  # GET /clients
  def index
    render json: clients_by_user
  end

  # GET /clients/:id
  def show
  end

  def clients_by_user
    clients = Client.where(user_id: @current_user_id)
    clients
  end


  # POST /clients
  def create
    is_exist = Client.where(user_id: @current_user_id, email:client_params[:email] ).exists?
   if is_exist
     render json: {msg: 'User is already exist'}
      else
      @client = Client.new(client_params)
      @client.user_id = @current_user_id

        if @client.save
          render json: clients_by_user, status: :created
        else
          render json: @client.errors, status: :unprocessable_entity
        end
    end
  end

  # PATCH/PUT /clients/
  def update

      if Client.where(id: client_params[:id]).update(client_params)
        render json: clients_by_user, status: :ok
      else
       render json: @client.errors, status: :unprocessable_entity 
      end
   
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def client_params
      params.permit(:firstName, :lastName, :email, :phone, :gender, :id, :status )
    end
end
