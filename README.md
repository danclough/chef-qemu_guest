# qemu_guest

This cookbook installs the QEMU Guest Agent and VirtIO Guest Tools on Linux and Windows hosts.

## Requirements

### Platforms
* Debian
* Ubuntu
* Red Hat Enterprise Linux
* Windows

### Attributes

On Linux guests, this cookbook uses the OS package manager to obtain the latest QEMU Guest Agent.  Linux guests do not require VirtIO guest tools, as most drivers are compiled into the kernel.

On Windows guests, this cookbook leverages two attributes to determine the location of the QEMU Guest Agent and VirtIO Guest Tools packages.
* `['qemu_guest']['ga_windows_url']` - Defaults to https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-qemu-ga
* `['qemu_guest']['gt_windows_url']` - Defaults to https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio

On systems that do not appear to be hypervisor guests, no action will be taken.  This is determined by the `node['virtualization']['role']` runtime attribute which is either `host` or `guest`.

## Recipes

### default

1. Installs the `qemu-guest-agent` package from the OS package manager or from the `.msi` installer on the designated HTTP mirror.
2. **(Windows only)** Installs the `virtio-win-gt` package from the `.msi` installer designated HTTP mirror.
