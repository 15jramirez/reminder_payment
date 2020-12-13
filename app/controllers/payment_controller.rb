class PaymentController < ApplicationController
    #create payment
    get '/account/new_payment' do
        redirect_if_not_logged_in
        erb :'payments/new_payment'
    end

    post '/account' do 
        user = current_user
        payment = Payment.new(params)
        payment.save
        if payment.save
            current_user.payments << payment
        redirect "/account/#{payment.id}"
        end
    end

    get '/account' do 
        redirect_if_not_logged_in
        erb :'users/account'
    end

    get '/account/:id' do 
        binding.pry
        redirect_if_not_logged_in
        payment = Payment.find(params[:id])
        erb :'payments/show_payment'
    end

    get '/account/:id/edit' do 
        redirect_if_not_logged_in
        @payment = Payment.find(params[:id])
        erb :'payments/edit'
    end

    patch '/account/:id' do 
        @payment = Payment.find(params[:id])
        @payment.update(params[:payment])
        redirect "/account/#{@payment.id}"
    end

    delete '/account/:id' do
        @payment = Payment.find(params[:id])
        @payment.destroy
        redirect to "/account"
      end


end