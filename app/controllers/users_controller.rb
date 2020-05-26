class UsersController < ApplicationController
  before_action :get_user_token, only: [:get_user, :update, :destroy, :index]
  before_action :set_user, only:[:update]
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy, :login, :get_user]

  # GET /users
  def index
    render json: @current_user
  end

  # GET /users/{id}
  def show
    @user = User.includes(:clients, :workouts).find(params[:id])
    # render json: [@user,clients: @user.clients,workouts: @user.workouts], status: :ok

    render json: @user
  end


  # POST /users (Register)
  def create
    user = User.new(user_params)

    respond_to do |format|
      if user.save
        token = JsonWebToken.encode(user:{id: user.id, email: user.email})
        puts token
        format.json { render json: {token: token, status: :created}, status: :created, location: user }
      else
        format.json { render json: { error: user.errors }, status: :unprocessable_entity }
        puts user.errors
      end
    end
  end

  # POST /users/login (Login)

  def login
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      token = JsonWebToken.encode(user:{id: @user.id})
      render json: {token: token}
    else
      render json: {error: [{msg:'Invalid Credentials'}]}, status: :unprocessable_entity
    end
  end

  # GET /auth/auth_user
  def get_user
    render json: @current_user
  end


  #PUT /users/update (Update User)
  def update
    if @current_user.update(user_params)
      render json: @current_user, status: :ok
      else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/{id} (Destroy User)
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.inclueds(:clients, :workouts).find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:firstName, :lastName, :email, :password, :password_confirmation)
    end
end
