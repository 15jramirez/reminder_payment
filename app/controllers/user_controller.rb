class UserController < ApplicationController
    #create an account
    get '/signup' do 
        if logged_in
            erb :'payments/account'
        else
            erb :'users/signup'
        end
    end

    post '/signup' do 
     if params[:username] == "" || params[:password] ==""
        erb :'users/error'
     else
        new_account = User.create(username: params[:username], password: params[:password])
        if new_account.save 
        session[:user_id] = new_account.id
        redirect :'/account'
        end
     end
    end

    #login 
    get '/login' do
        if logged_in
            erb :'payments/account'
        else
           erb :'users/login'
        end
    end
    
    post '/login' do
        user = User.find_by(username: params[:username], password: params[:password])
       if user && user.authenticate(params[:password], params[:username])
            session[:user_id] = user.id
            redirect :'/account'
       else
         erb :'users/error'
       end
    end

    #logout
    get '/logout' do 
        session.clear
        redirect_if_not_logged_in
    end

end