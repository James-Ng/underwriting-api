# author : Binh Nguyen
class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  def index
    p 'feature/#3'
    p 'close issue #3'
    p 'close issue #3'
    p 'close issue #3'
    p 'issue #12'
    p 'issue #12'
    render json:{ message: "I'm Binh Nguyen. My email is : james.nguyen.vnn@gmail.com" }
  end
end
