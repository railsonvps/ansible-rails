#!/usr/bin/env puma

bind 'unix:///home/{{ user }}/{{ app_name }}/shared/tmp/sockets/puma.sock'
directory '/home/{{ user }}/{{ app_name }}/current'
rackup "/home/{{ user }}/{{ app_name }}/current/config.ru"
pidfile "/home/{{ user }}/{{ app_name }}/shared/tmp/pids/puma.pid"
state_path "/home/{{ user }}/{{ app_name }}/shared/tmp/pids/puma.state"
stdout_redirect '/home/{{ user }}/{{ app_name }}/shared/log/puma_access.log', '/home/{{ user }}/{{ app_name }}/shared/log/puma_error.log', true

environment 'production'
threads {{ puma_threads }}
workers {{ puma_workers }}

preload_app!
prune_bundler

on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/{{ user }}/{{ app_name }}/current/Gemfile"
end

# Required for preload_app!
on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end
