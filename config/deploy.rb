require 'sshkit/sudo'

# config valid only for current version of Capistrano
lock '3.4.0'


# Change these
server '188.166.223.168', roles: [:web, :app, :db], primary: true
set :application, 'lhisa'
set :repo_url, 'git@github.com:union-software-cooperative/labourhireinquiry'
set :branch, 'lhisa_master'
set :deploy_to, "/var/www/#{fetch(:application)}"
set :user,            'deploy'
set :puma_threads,    [4, 16]
set :puma_workers,    0

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.3.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
#set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_bind, "tcp://127.0.0.1:3000"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
set :linked_files, %w{config/application.yml}
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/#{fetch(:branch)}`
        puts "WARNING: HEAD is not the same as origin/#{fetch(:branch)}"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Send config files'
  task :send_linked do
  	on roles(:app), in: :parallel do |server|
  	  fetch(:linked_files).each do |file|
  	  	`scp '#{file}' '#{fetch(:user)}@#{server.hostname}:#{shared_path}/config/'`
  	  end
  	end
  end

	desc "reload the database with seed data"
	task :seed do
		  # Doesn't work, user can't login
	    `cd #{release_path}; bundle exec rake db:seed RAILS_ENV=production`
	end
	
  desc 'Setup database'
  task :setup_db do
  	on roles(:app), in: :parallel do |server|
  		  # prompts for two passwords unfortunately, but better than nothing
  		  ask :pg_password, "Postgresql database password for the app: "
  		  user_cmd = "create user #{fetch(:application)} with password '#{fetch(:pg_password)}';"
  		 	db_cmd = "create database #{fetch(:application)}_#{fetch(:stage)} owner #{fetch(:application)};"
  		  sudo "-u postgres psql -c \"drop role #{fetch(:application)}\""
  		  sudo "-u postgres psql -c \"#{user_cmd}\""
  		  sudo "-u postgres psql -c \"#{db_cmd}\""
  		  invoke 'deploy:seed'
  	end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy:send_linked'
      #invoke 'deploy:create_db_user'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma