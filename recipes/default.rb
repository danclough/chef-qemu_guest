#
# Cookbook:: qemu-guest
# Recipe:: default
#

if node['virtualization']['role'] == 'guest'
  arch_str =  case node['kernel']['machine']
              when 'x86_64'
                'x64'
              when 'i386'
                'x86'
              end

  package 'QEMU Guest Agent' do
    if platform_family?('windows')
      source "#{node['qemu-guest']['ga_windows_url']}/qemu-ga-#{arch_str}.msi"
      installer_type :msi
      action :install
    else
      package_name 'qemu-guest-agent'
    end
  end

  if platform_family?('windows')
    package 'QEMU Windows Guest Tools' do
      source "#{node['qemu-guest']['gt_windows_url']}/virtio-win-gt-#{arch_str}.msi"
      installer_type :msi
      action :install
    end
  end
end
