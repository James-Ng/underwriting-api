# author : Binh Nguyen
class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  def index
    p 'feature/#4'
    p 'close issue #4'
    p 'sss'
    render json:{ message: "I'm Binh Nguyen. My email is : james.nguyen.vnn@gmail.com" }
  end
end
