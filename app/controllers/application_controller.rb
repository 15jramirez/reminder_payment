require './config/environment'
class ApplicationController < Sinatra::Base
   configure do
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
            !!current_user
        end

        def current_user
            @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end

        def redirect_if_not_logged_in
            if logged_in == false
              redirect "/"
            end
        end
        
    end
end