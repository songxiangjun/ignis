$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
require 'bundler/capistrano'
set :rvm_ruby_string, 'ruby-1.9.2-p290'        # Or whatever env you want it to run in.

set :application, "ignis"
set :repository,  "git@github.com:crueber/ignis.git"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true 
set :scm, :git
set :branch, "master"
set :scm_username, "crueber"
# set :scm_password, Capistrano::CLI.password_prompt('Git Password: ')

set :user, 'root'
# set :password, Capistrano::CLI.password_prompt('Packden Password: ')

role :web, "packden.com"
role :app, "packden.com"
role :db,  "packden.com", :primary => true

set :deploy_to, "/opt/ignis"
set :rails_env, "production"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
