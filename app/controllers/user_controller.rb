class UserController < ApplicationController
    #create method
    get '/signup' do 
        erb :'users/signup'
    end

    post '/account' do 
        binding.pry
        #create an instance of user
        user = User.create(username: params[:username], email: params[:email], password: params[:password])
        #add session to user
        #redirect this to account? 
    end

    #login 
    get '/login' do
    erb :'users/login'
    end
    
    post '/account' do
        #find by session of user
        #raise an error if incorrect
        #redirect to account
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