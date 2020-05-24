class MovementsController < ApplicationController
  before_action :set_movement, only: [:show, :edit, :update, :destroy]
  before_action :get_user_token, only: [:index, :create, :update]
  skip_before_action :verify_authenticity_token, :only => [:index, :create, :update, :destroy]
  def index
   movements = Movement.all 
   render json: movements, status: :ok
  end

  def create
    new_movement = Movement.new(movement_params)

    if new_movement.save
      :index
    else 
      render json: new_movement.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
  end

  def destroy
    @movement.destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @movement = Movement.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def movement_params
      params.permit(:name, :description, :video_url )
    end
 
end
