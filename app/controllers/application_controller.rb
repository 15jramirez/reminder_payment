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

        def redirect_if_not_logged_in
            if logged_in == false
              redirect "/"
            end
        end
        
    end
end