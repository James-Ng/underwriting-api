class ApplicationController < ActionController::API
  def index
    render json: {message: 'hello'}
  end
end
