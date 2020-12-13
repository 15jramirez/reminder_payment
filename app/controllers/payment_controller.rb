class PaymentController < ApplicationController
    #create payment
    get '/account/new_payment' do
        redirect_if_not_logged_in
        erb :'payments/new_payment'
    end

    post '/account' do 
        user = current_user
        @payment = Payment.new(
            name: params[:name],
            description: params[:description],
            amount: params[:amount],
            due_date: params[:due_date],
            user_id: user.id
        )
        @payment.save
        redirect "/account/#{@payment.id}"
    end

    get '/account' do 
        redirect_if_not_logged_in
        @payments = Payment.all 
        erb :'users/account'
    end

    get '/account/:id' do 
        redirect_if_not_logged_in
        @payment = Payment.find_by(params[:id])
        erb :'payments/show_payment'
    end

    get '/account/:id/edit' do 
        redirect_if_not_logged_in
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