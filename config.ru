require './config/environment' #requires environment

if ActiveRecord::Migrator.needs_migration?
    raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
  end
  
use Rack::MethodOverride 
use UserController
run ApplicationController #mounting main controller