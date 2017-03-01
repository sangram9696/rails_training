class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def welcome
    render html: "This is my first tutorial"
   end
end