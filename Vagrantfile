# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.box = 'bento/ubuntu-16.04'

  config.vm.hostname = 'rails-getting-started'

  if Vagrant::Util::Platform.windows?
    config.vm.synced_folder '.', '/vagrant'
  else
    config.vm.network 'private_network', ip: '192.168.100.100'
    config.vm.synced_folder '.', '/vagrant', type: :nfs
  end

  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box

    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    } unless Vagrant::Util::Platform.windows?
  end

  config.vbguest.auto_update = false if Vagrant.has_plugin?('vagrant-vbguest')

  config.vm.provider 'virtualbox' do |vb|
    vb.cpus = 2
    vb.memory = 1024
  end

  # Run Ansible from the Vagrant VM
  config.vm.provision 'ansible_local' do |ansible|
    ansible.install_mode = :pip
    ansible.version = '2.2.0'
    ansible.playbook = 'playbook.yml'
  end
end
