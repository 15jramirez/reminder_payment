require './config/environment' #requires environment

if ActiveRecord::Base.connection.migration_context.needs_migration?
    raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
  end

use Rack::MethodOverride #for later use of patch/delete routes
run ApplicationController #mounting main controller