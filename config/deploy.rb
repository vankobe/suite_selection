set :application, "sweeta"
set :repository,  "ssh://app@49.212.221.48/~/git/sweeta.git"
#set :repository,  "/home/masato/dev/suite_selection/"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache

role :web, "49.212.221.48"                          # Your HTTP server, Apache/etc
role :app, "49.212.221.48"                          # This may be the same as your `Web` server
role :db,  "49.212.221.48", :primary => true # This is where Rails migrations will run
#role :db,  "49.212.221.48"

# ssh
set :user, "app"
set :ssh_options, :port => 22, :forward_agent => true, :keys => "/home/masato/.ssh/id_dsa", :passphrase => "2Gyouza7"
set :use_sudo, false
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
task :list do
  run "ls"
end

#namespace :assets do
#  task :precompile, :roles => :web do
#    run "cd #{current_path} && RAILS_ENV=production bundle exec rake assets:precompile"
#  end
#end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
namespace :dragonfly do
  desc "Symlink the Rack::Cache files"
  task :symlink, :roles => [:app] do
    run "mkdir -p #{shared_path}/tmp/dragonfly && ln -nfs #{shared_path}/tmp/dragonfly #{release_path}/tmp/dragonfly"
  end
end
after 'deploy:update_code', 'dragonfly:symlink'
