class HomeController < ApplicationController
  def index
    render json: 'Welcome to RFIT API on Rails'
  end
end
