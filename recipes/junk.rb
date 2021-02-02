#
# Cookbook:: simpleweb
# Recipe:: junk
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe 'git'

log "============ test cookbook ** #{node['whoami']} **" do
  level :info
end
Chef::Log.info("============ test cookbook ** #{node['whoami']} **")
