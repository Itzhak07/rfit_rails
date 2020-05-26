# require 'pry'

class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  before_action :get_user_token, only: [:index, :create, :update, :destroy, :create_workout_and_sets]
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy, :create_workout_and_sets]

  def index
   workouts_by_user
  end

  def workouts_by_user
    workouts = Workout.includes(:client,:work_sets).where(user_id: @current_user_id)

    render json: workouts
  end

  def show
    @workout = Workout.includes(:client, :work_sets).find(params[:id])
    render json: @workout
  
  end

  def create
    create_workout_and_sets

  end

  def create_workout_and_sets
    Workout.transaction do
      WorkSet.transaction do
        @new_workout = Workout.new({
          startDate: workout_params[:startDate],
          endDate: workout_params[:endDate],
          notes: workout_params[:notes],
          date: workout_params[:startDate],
          user_id: @current_user_id,
          client_id: workout_params[:client_id]
        })
        @new_workout.save!

        @work_sets = workout_params[:work_sets]

        @work_sets.each do |set|
          set[:workout_id] = @new_workout.id
          WorkSet.create(set)
        end

        workouts_by_user

      end
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
      params.permit(:notes, :startDate, :endDate, :date, :client_id, :id, work_sets: [:movement_id, :reps, :rounds, :weight, :workout_id])
    end
end
