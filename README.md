# proxmox_cluster_ansible_playbook
## An experiment in Proxmox, embedded hardware, and networking

This project is basically intended to be a build log for a 5-node "fully-hyperconverged" Proxmox VE cluster lab I am building, though it's also intent on being generic enough to be reusable with few (if any) modifications for something more production-ready.

I intend to build this lab for the sake of learning more about Proxmox, enterprise/datacenter/provider-grade networking, and clustered storage.

In essence, this playbook should build you a multi-node Proxmox cluster with CephFS, Ceph RBD for VM disks, SDN installed and enabled (and ideally with some zones defined), and so on. Maybe I can script adding some VM templates or something, even…

Ideally this playbook and the resulting Proxmox cluster will follow best practices as much as possible, but it should be noted that presently the official Proxmox VE documentation states that "supported installations" should be done from the official Proxmox VE media, which precludes this entirely.

Whenever possible, things will be done within Proxmox's own tooling. Presently Proxmox's SDN setup _does have_ IPAM functionality and a PowerDNS plugin, but it isn't very fleshed out, so expect to see maybe PowerDNS and Netbox containers or something.

Also, it's really not done yet, so until this README says otherwise please don't just blindly run this playbook! But ideally it will be a good "complex example" for [ansible-role-proxmox](https://github.com/lae/ansible-role-proxmox) that you can pretty much just deploy.
