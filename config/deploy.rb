require "bundler/capistrano"

set :user, 'barbersoakland'  # Your dreamhost account's username
set :domain, 'ps447939.dreamhost.com'  # Dreamhost servername where your account is located 
set :project, 'barbers-oakland'  # Your application as its called in the repository
set :application, 'http://barbersoakland.com'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/#{application}"  # The standard Dreamhost setup
set :scm, 'git'
set :repository,  "https://github.com/nofrazie/barbers-oakland.git"
set :deploy_via, :remote_cache
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :rails_env, "production"
set :keep_releases, 5
server "nolanfrazier@ps447939.dreamhost.com", :app, :web, :db, :primary => true

# version control config
set :scm_username, 'nolanfrazier'
set :scm_password, 'Osborne1988'

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# deploy config
set :deploy_to, "http://barbersoakland.com"
set :deploy_via, :copy

# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/Path/To/id_rsa)            # If you are using ssh_keys
set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false
