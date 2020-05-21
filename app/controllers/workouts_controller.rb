class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  before_action :get_user_token, only: [:index, :create, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]

  def index
   workouts_by_user

  end

  def workouts_by_user

    workouts = Workout.where(user_id: @current_user_id)

    render json: workouts
  end

  def create
    @workouts = Workout.new(workout_params)
    @workouts.user_id = @current_user_id

    if @workouts.save
     workouts_by_user
    else
      render json: @workouts.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @workout.destroy

    workouts_by_user
  end


  def update
    if Workout.where(id: workout_params[:id]).update(workout_params)
      workouts_by_user

    else
     render json: @workout.errors, status: :unprocessable_entity 
    end

  end

  private

    def set_workout
    @workout = Workout.find(params[:id])
    end

    def workout_params
      params.permit(:notes, :date, :startDate, :endDate, :client_id, :id )
    end
end
  



