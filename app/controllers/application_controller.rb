# author : Binh Nguyen
class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  def index
    render json: { message: "I'm Binh Nguyen. My email is : james.nguyen.vnn@gmail.com" }
  end
end
