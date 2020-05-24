class WorkSetsController < ApplicationController
  before_action :set_workset, only: [:show, :edit, :update, :destroy]
  before_action :get_user_token, only: [:index, :create, :update]
  skip_before_action :verify_authenticity_token, :only => [:index, :create, :update, :destroy]

  def index
    sets = WorkSet.includes(:movement).all

    render json: sets
  end

  def create
    new_set = WorkSet.new(workset_params)
    if new_set.save
    :index
    else 
      render json: new_set.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
  end

  def destroy
    @set.destroy
    :index
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_workset
    @set = WorkSet.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def workset_params
    params.permit(:movement_id, :workout_id, :rounds, :reps, :weight)
  end
end
