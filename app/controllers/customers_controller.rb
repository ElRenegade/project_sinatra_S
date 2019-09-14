class CustomerController < ApplicationController

    get '/index' do
        erb :'customers/index'
    end

    get '/signup' do
        erb :'customers/signup'
    end

    post '/signup' do
        if params[:username].emtpy?
            redirect to '/failure'
        end

        customer = Customer.new(username: params[:username], password: params[:password])
        if cusmter.save
            redirect '/login'
        else
            redirect '/fail'
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
        customer = Customer.find_by(username: params[:username])
        if customer && customer.authenticate(params[:password])
            session[:customer_id] = cutomer.id
            redirect '/customers/account'
        else
            redirect '/customers/failure'
        end
    end

    get '/failure' do
        erb :'customers/failure'
    end

    get '/logout' do
        session.clear
        redirect '/customers'
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
