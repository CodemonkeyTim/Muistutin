set :application, "Muistutin"
set :repository,  "git@github.com:CodemonkeyTim/Muistutin.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "production"

role :web, "lassinmuistutin.myeffect.net"                          # Your HTTP server, Apache/etc
role :app, "lassinmuistutin.myeffect.net"                          # This may be the same as your `Web` server
role :db,  "lassinmuistutin.myeffect.net", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :username, "teemu"
set :scm_passphrase, "Ticnbi'89"
set :scm_verbose, true
set :use_sudo, false

set :deploy_to, "~/rails/Muistutin"
set :ssh_options, {:forward_agent => true}
set :deploy_via, :remote_cache


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end