class WorkoutsController < ApplicationController
  before_action :get_user_token, only: [:index, :update, :destroy]

  def index
   workouts = Client.find_by user_id: @current_user_id

    render json: workouts

  end

  def create
    workouts = Workout.new(workout_params)
    workout.user_id = @current_user_id

  end

  def destroy
  end

  def update
  end

  private

    def workout_params
      params.permit(:notes, :date, :startDate, :endDate, :client_id )
    end
  end


end
