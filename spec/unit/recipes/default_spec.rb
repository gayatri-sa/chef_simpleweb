#
# Cookbook:: simpleweb
# Spec:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'simpleweb::default' do
  context 'When all attributes are default, on Windows' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'windows'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    
    it 'expected to copy C:/tmp/setpath.ps1' do
      expect(chef_run).to create_cookbook_file('C:/tmp/setpath.ps1')
    end
  end

end

describe 'simpleweb::junk' do
  context 'When all attributes are default, on Windows' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    #platform 'ubuntu', '20.04'
    platform 'windows'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end    
  end

  context 'When all attributes are default, on Ubuntu 20.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '20.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
