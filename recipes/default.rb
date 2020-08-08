#
# Cookbook:: qemu-guest
# Recipe:: default
#

if node['virtualization']['role'] == 'guest'
  package 'QEMU Guest Agent' do
    if platform_family?('windows')
      source "#{node['qemu_guest']['ga_windows_url']}/qemu-ga-#{node['kernel']['machine']}.msi"
      installer_type :msi
      options '/q'
      action :install
    else
      package_name 'qemu-guest-agent'
    end
  end

  if platform_family?('windows')
    arch_str =  case node['kernel']['machine']
                when 'x86_64'
                  'x64'
                when 'i386'
                  'x86'
                end
    windows_package 'QEMU Windows Guest Tools' do
      source "#{node['qemu_guest']['gt_windows_url']}/virtio-win-gt-#{arch_str}.msi"
      installer_type :msi
      options '/q /norestart'
      action :install
    end
  end
end
