class PaymentController < ApplicationController
    #create payment
    get '/account/payment/new' do 
        erb :'payments/new_payment'
    end

    post '/account' do 
        payment = Payment.create(params[:payments])
        redirect "/account/#{payment.id}"
    end

    get '/account' do 
        @payments = Payment.all 
        erb :'users/account'
    end

    get '/account/:id' do 
        @payment = Payment.find_by(params[:id])
        erb :'payments/show_payment'
    end

    get '/account/:id/edit' do 
        @payment = Payment.find_by(params[:id])
        erb :'payments/edit'
    end

    patch '/account/:id' do 
        @payment = Payment.find_by(params[:id])
        @payment.update(params[:payment])
        redirect "/account/#{@payment.id}"
    end

    delete '/account/:id' do
        @payment = Payment.find_by(params[:id])
        @payment.destroy
        redirect to "/account"
      end


end