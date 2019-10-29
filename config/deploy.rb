# require "capistrano-resque"

# config valid only for current version of Capistrano
lock '3.4.1'

set :application, 'au_pair_simple'
set :repo_url, 'git@github.com:shangyukyo/au_pair.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :delayed_job_workers, 2

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "~/www/#{fetch(:application)}/"
set :delayed_log_dir, "#{shared_path}/log"

set :unicorn_config_path, "#{current_path}/config/unicorn.rb"
set :whenever_identifier, -> { "#{fetch(:application)}" }

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

set :default_env, {
  'OFFICIAL_SOURCE' => 'yes'
}

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push(
  'config/database.yml', 
  'config/secrets.yml', 
  'config/unicorn.rb'
)

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :rvm_ruby_version, '2.4.1'

set :rails_env, :production

# set :rvm_type, :user

# Default value for keep_releases is 5
set :keep_releases, 5

set :pid_path, "#{shared_path}/tmp/pids"
set :log_path, "#{shared_path}/log"
set :unicorn_pid, -> {"#{current_path}/tmp/pids/unicorn.pid"}
set :whenever_identifier, -> { "#{fetch(:application)}" }

namespace :deploy do
  task :restart do
    invoke 'unicorn:legacy_restart'
  end
end

after 'deploy:published', 'deploy:restart'
