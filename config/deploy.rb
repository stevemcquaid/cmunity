require "rvm/capistrano"
require "bundler/capistrano"

set :rvm_type, :system
set :rvm_ruby_string, :release_path

server "devsrv4.res.cmu.edu", :web, :app, :db, primary: true

set :application, "cmunity"
set :user, "deploy"
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :rake, "bundle exec rake"

set :scm, "git"
set :repository, "git@github.com:stevemcquaid/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  
  desc "Restarts Passenger"
  task :start, :roles => :app do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end
  
  task :stop do; end
  
  task :restart, roles: :app, except: {no_release: true} do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  desc "Sets permissions for Rails Application"
  task :set_permissions do
    puts "\n\n=== Setting Permissions! ===\n\n"
    run "sudo chown -R www-data:www-data #{deploy_to}"
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/apache.conf /etc/apache2/sites-available/#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end

  desc "Run a command on the remote server. Specify command='my_command'."
  task :run_command do
    run "cd #{current_path}; #{ENV['command']}"
  end
  
  before "deploy", "deploy:check_revision"

  # Datbase Tasks


  namespace :db do

    desc "Syncs the database.yml file from the local machine to the remote machine"
    task :sync_yaml do
      puts "\n\n=== Syncing database yaml to the production server! ===\n\n"
      unless File.exist?("config/database.yml")
        puts "There is no config/database.yml.\n "
        exit
      end
      system "rsync -vr --exclude='.DS_Store' config/database.yml #{user}@#{application}:#{shared_path}/config/"
    end
    
    desc "Create Production Database"
    task :create do
      puts "\n\n=== Creating the Production Database! ===\n\n"
      run "cd #{current_path}; rake db:create RAILS_ENV=production"
      system "cap deploy:set_permissions"
    end

    desc "Migrate Production Database"
    task :migrate do
      puts "\n\n=== Migrating the Production Database! ===\n\n"
      run "cd #{current_path}; rake db:migrate RAILS_ENV=production"
      system "cap deploy:set_permissions"
    end

    desc "Resets the Production Database"
    task :migrate_reset do
      puts "\n\n=== Resetting the Production Database! ===\n\n"
      force_close_and_drop_db
      run "cd #{current_path}; rake db:migrate:reset RAILS_ENV=production"
    end
 
    
    desc "Destroys Production Database"
    task :drop do
      puts "\n\n=== Destroying the Production Database! ===\n\n"
      run "cd #{current_path}; rake db:drop RAILS_ENV=production"
      system "cap deploy:set_permissions"
    end

    desc "Moves the SQLite3 Production Database to the shared path"
    task :move_to_shared do
      puts "\n\n=== Moving the SQLite3 Production Database to the shared path! ===\n\n"
      run "mv #{current_path}/db/production.sqlite3 #{shared_path}/db/production.sqlite3"
      system "cap deploy:setup_symlinks"
      system "cap deploy:set_permissions"
    end

    desc "Populates the Production Database"
    task :seed do
      puts "\n\n=== Populating the Production Database! ===\n\n"
      run "cd #{current_path}; rake db:seed RAILS_ENV=production"
    end

    desc "Force disconnect of open backends and drop database"
    task :force_close_and_drop_db do
      dbname = 'cmunity_production'
      run "psql -U postgres -h localhost",
          :data => <<-"PSQL"
             REVOKE CONNECT ON DATABASE #{dbname} FROM public;
             ALTER DATABASE #{dbname} CONNECTION LIMIT 0;
             SELECT pg_terminate_backend(pid)
               FROM pg_stat_activity
               WHERE pid <> pg_backend_pid()
               AND datname='#{dbname}';
             DROP #{dbname};
          PSQL
    end
    before "db:migrate_reset", "db:force_close_and_drop_db"
    before "db:drop", "db:force_close_and_drop_db"
  end


end