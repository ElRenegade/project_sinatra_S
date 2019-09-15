class GlovesController < ApplicationController
    get '/gloves' do
        @gloves = Gloves.all
        erb :'orders/index'
    end


end