require './config/environment'
class ApplicationController < Sinatra::Base
   configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
   end

   #homepage of app
   get '/' do 
    if logged_in
        @user = current_user
        #maybe put here all the instances of the post to the user
        redirect :'/account'
    else
        erb :'/homepage' 
    end
   end

   #helper methods
   helpers do 
        def logged_in
            !!session[:user_id]
        end

        def current_user
            User.find(session[:user_id])
        end
        
    end
end