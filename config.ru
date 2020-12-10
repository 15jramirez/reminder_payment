require './config/environment' #requires environment

if ActiveRecord::Migrator.needs_migration? #reminder to run migrations
  raise 'Migrations are pending. Run 'rake db:migrate'
end

use Rack::MethodOverride #for later use of patch/delete routes
runApplicationController #mounting main controller