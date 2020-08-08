# InSpec test for recipe qemu-guest::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless platform_family?('windows')
  describe package('qemu-guest-agent') do
    it { should be_installed }
  end
end
