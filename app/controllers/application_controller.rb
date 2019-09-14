require './config/environment'
require './app/models/customer'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "snack_shack"
    enable :sessions
  end

  
end
