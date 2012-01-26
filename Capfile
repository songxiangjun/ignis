# require 'bundler/capistrano'

load 'deploy' if respond_to?(:namespace) # cap2 differentiator
load 'deploy/assets'
Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy' # remove this line to skip loading any of the default tasks

namespace :logs do
  task :watch do
    stream("tail -f /opt/ignis/shared/log/production.log /var/log/apache2/error.log")
  end
end







# namespace :rake do
#   task :show_tasks do
#     run "cd #{deploy_to}/current && /usr/bin/env rake -T"
#   end
# end

# before "deploy:restart" do
#   run "mkdir "+ deploy_to + "/current/public/assets" 
#   run "chmod o+w "+ deploy_to + "/current/public/assets" 
#   #run "cd #{deploy_to}/current && /usr/bin/env rake barista:brew"
#   
#   require 'jammit'
#   Jammit.package!
# end
