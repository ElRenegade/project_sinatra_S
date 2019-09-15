class CustomerController < ApplicationController

    get '/signup' do
        erb :'customers/signup'
    end

    post '/signup' do
        if params[:username] == "" || params[:password] == ""
            redirect to '/signup'
          else
            @customer = Customer.create(:username => params[:username], :password => params[:password])
            session[:customer_id] = @customer.id
            redirect '/login'
          end
    end

    get '/account' do
        @customer = Customer.find(session[:customer_id])
        erb :'customers/account'
    end

    get '/login' do
        erb :'customers/login'
    end
 
    post '/login' do
        customer = Customer.find_by(:username => params[:username])
        if customer && customer.authenticate(params[:password])
            session[:customer_id] = customer.id
            redirect to '/account'
        # else
        #     redirect to '/failure'
        end
    end

    get '/failure' do
        erb :'customers/failure'
    end

    get '/logout' do
        session.clear
        redirect '/customers'
    end

    


end
