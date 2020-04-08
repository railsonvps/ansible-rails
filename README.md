<div style="text-align: center; width: 300px;"><img src="https://www.railsonvps.com/img/logo.svg" alt="RailsOnVPS Logo"></div>

# Ruby on Rails Ansible Playbook
A beginner-friendly and well-documented Ansible playbook that configures your Ubuntu server for running a Ruby on Rails application. A step-by-step installation guide can be found at [railsonvps.com](https://www.railsonvps.com).

## Who is it for?
RailsOnVPS is trying to make it as easy as possible to run your Rails app on your own server.
It is faster and cleaner than configuring a server "by hand" and makes it easy to switch servers if needed. 
Running your own server is a great choice if you want to keep costs low and maintain full control over your environment or if you simply like the feeling of having my your own machine.  

You should know how to use a commandline, but we don't assume prior sysadmin experience.

## What's inside?
An Ansible playbook describes a server configuration in code. This playbook describes a configuration that contains everything required for running a typical Ruby on Rails app.

It manages basic configuration:
* Creates a new user
* Copies your SSH key for simpler login
* Set the system locale
* Sets up a firewall
* Creates a directory structure for deployments with Capistrano

It installs the following components:
* Nginx (webserver)
* Certbot ("free HTTPS")
* Ruby (using ruby-install and chruby)
* Puma (app server)
* Postgres (database)
* Redis (caching and message broker for Sidekiq)
* Sidekiq (running asynchonous jobs)
* Additional dependencies to support Webpacker for managing your assets

## Step-by-Step Setup
If you are a beginner, we recommend you to follow our [Step-by-Step Setup Guide](https://www.railsonvps.com/docs/getting-started/configuring-your-server).
It provides you with detailed instructions and explanations on how to get from a fresh server to a running app.   

## Quickstart
If you have more experience, this might be all the information you need:

### Requirements
* Ansible is installed on your local system 
* You have root access to your server and it runs Ubuntu 18.04 or higher

### Setup
1. Copy `hosts.example` to `hosts` and add your server's host name to it.
2. Copy `group_vars/all.example` to `group_vars/all` and set all included variables.
3. Run `ansible-playbook site.yml -i hosts`
4. Integrate your app with Capistrano according to [Integrating with your app](https://www.railsonvps.com/docs/getting-started/integrating-with-your-app).

## Support and Contributing
If you're running into issues, please let me know by creating an issue. PRs are, of course, very welcome!  