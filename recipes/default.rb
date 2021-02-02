#
# Cookbook:: simpleweb
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe 'git'

# since the git path is not being set I am doing it manually via a powershell script
cookbook_file 'Copy powershell script' do
  source 'setpath.ps1'
  path 'C:/tmp/setpath.ps1'
end
powershell_script 'Set Path' do
  code '. C:\tmp\setpath.ps1'
end

# simpleweb_from_git 'https://github.com/schogini/customweb' do
simpleweb_from_git 'https://github.com/gayatri-sa/simple_dotnet' do
  folder_name 'simple'
end

# remote_directory 'Copy .Net Project' do
#   source 'simple_db_dot_net'
#   path 'C:/inetpub/wwwroot/simple'
#   recursive true
# end

execute 'Execute the SQL file' do
  command 'mysql -h 127.0.0.1 -u root -pdbrootpass -e "source C:/inetpub/wwwroot/simple/SQL/MySQL.sql"'
  cwd     'C:\Program Files\MariaDB 10.5\bin'
  # guard_interpreter :powershell_script
  # only_if powershell_out('(C:\Program Files\MariaDB 10.5\bin\mysql -h 127.0.0.1 -u root -pdbrootpass ajaxsamples -e "SELECT 1 from customers"| Measure-Object -line).lines').stdout.empty?
  # only_if powershell_out('C:\Program Files\MariaDB 10.5\bin\mysql -h 127.0.0.1 -u root -pdbrootpass ajaxsamples -e "SELECT 1 from customers"').error?
end
