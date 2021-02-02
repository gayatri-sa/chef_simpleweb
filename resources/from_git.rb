# Clone a website from a GitHub repo into the appropriate folder
# resource_name :website_from_git # deprecated. Now the resource name is taken from the <cookbookname>_<filename>

property :repo_name, String, name_property: true
property :folder_name, String, default: ''
property :webserver, String, default: 'apache'

# The first action is always the default action
action :create do
  # find the folder root depending on the OS and Webserver
  root_folder = if platform?('windows')
                  'C:/inetpub/wwwroot/'
                elsif new_resource.webserver == 'nginx'
                  '/usr/share/nginx/html/'
                else
                  '/var/www/html/'
                end

  # delete the folder before clone, else clone will give an error "folder already exists"
  folder = "#{root_folder}#{new_resource.folder_name}"
  directory "#{folder}" do
    action :delete
    recursive true
    only_if { ::File.directory?("#{folder}") }
  end

  # clone the repo into othe correct folder
  git 'get_repo' do
    destination "#{folder}" # If not specified then, it will clone to /git_repo No trailing /
    repository new_resource.repo_name
    not_if { ::File.directory?("#{folder}") }
  end
end
