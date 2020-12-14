class PaymentController < ApplicationController
    #create payment
    get '/account/new' do
        redirect_if_not_logged_in
        erb :'payments/new_payment'
    end

    post '/account' do 
        payment = Payment.new( 
            :name => params[:name],
            :description => params[:description],
            :due_date => params[:due_date],
            :amount => params[:amount],
            :user_id => current_user.id)
        payment.save
        if payment.save
        redirect "/account/#{payment.id}"
        end

    end

    get '/account' do 
        redirect_if_not_logged_in
        erb :'payments/account'
    end

    get '/account/:id' do 
        redirect_if_not_logged_in
        @payment = Payment.find_by_id(params[:id])
            if @payment.user_id == current_user.id
            erb :'payments/show_payment'
            end
    end

    get '/account/:id/edit' do 
        redirect_if_not_logged_in
        @payment = Payment.find_by_id(params[:id])
        if @payment.user_id == current_user.id
            erb :'payments/edit'
        end
    end

    patch '/account/:id' do 
        @payment = Payment.find_by_id(params[:id])
        @payment.update(
            name: params[:name],
            amount: params[:amount],
            due_date: params[:due_date],
            description: params[:description]
            )
            redirect "/account/#{@payment.id}"
    end

    delete '/account/:id' do
        @payment = Payment.find_by_id(params[:id])
        @payment.destroy
        redirect to "/account"
      end


end