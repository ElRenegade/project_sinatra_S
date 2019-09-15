require './config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "snack_shack"
  end

get '/' do
    erb :'customers/index'
end

helpers do
  def logged_in?
      !!session[:customer_id]
  end

  def current_customer
      Customer.find(session[:customer_id])
  end
end


  
  
end
