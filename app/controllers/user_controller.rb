class UserController < ApplicationController
    #create an account
    get '/signup' do 
        erb :'users/signup'
    end

    post '/signup' do 
     if params[:username] == "" || params[:email] =="" || params[:password] ==""
        erb :'users/error'
     else
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = @user.id
        redirect :'/account'
     end
    end

    #login 
    get '/login' do
    erb :'users/login'
    end
    
    post '/login' do
        @user = User.find_by(:username => params[:username])
       if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect :'/account'
       else
         erb :'users/error'
       end
    end
    
    get '/account' do 
        @payments = Payment.all
        erb :'users/show'
    end

    #logout
    get '/logout' do 
        session.clear
        redirect '/'
    end

    #bonus (if have time)

    get '/account/settings' do
        #here will show users their email, password, and username
        #at bottom given option to edit account
        # erb :'users/settings'
    end

    get '/account/settings/edit' do 
        #this will allow to edit the page
        # erb :'users/settings'
    end

    # PATCH '/account/settings/' do 
    #     look up on how to edit a user account
    #     redirect to '/account/settings'
        
    # end

end