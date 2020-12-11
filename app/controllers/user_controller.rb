class UserController < ApplicationController
    #create method
    get '/signup' do 
        erb :'/users/signup'
    end

    post '/account' do 
     if params[:username].empty? || params[:email].empty? || params[:password].empty?
        redirect :'/error'
     else
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = @user.id
        redirect :'/users/account'
     end
    end

    #login 
    get '/login' do
    erb :'users/login'
    end
    
    post '/account' do
       user = User.find_by(params[:username])
       user_email = User.find_by(params[:email])
       binding.pry
       if user | user_email && user.authenticate(params[:password])
            session[:user_id] = user.id
            reidrect :'/users/account'
       else
        redirect :'/error'
       end
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