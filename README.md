# Software-Defined Data Center (SDDC) — Design & Implementation

A working software-defined data center, built on physical hardware. Compute, storage and networking are virtualised, and the platform hosts directory, cloud-application, web and e-mail services. The design follows the SDDC model: workloads run on logically defined resources, abstracted from the underlying hardware.

> Team project covering design, implementation, configuration, testing and technical documentation.

**Stack:** VMware ESXi 5.5 · vSphere Client · FreeNAS 11 (ZFS) · iSCSI · vSwitch / NIC teaming · Windows Server 2008 R2 · Active Directory / DNS / DHCP · Citrix XenApp 6.5 · AppServ (Apache, PHP, MySQL) · Exchange Server 2013

---

## Architecture

```
 FreeNAS 11 (ZFS, iSCSI LUNs) ──┐
 vSphere Client (management) ───┼── LAN switch ── VMware ESXi 5.5 host
 Wi-Fi access point ────────────┘                   │
                                                    ├─ VM1  Domain controller: AD, DNS, DHCP
                                                    ├─ VM2  Cloud server: Citrix XenApp 6.5
                                                    ├─ VM3  Web server: AppServ (Apache, PHP, MySQL)
                                                    └─ VM4  E-mail server: Exchange 2013
```

| Layer | Implementation |
|---|---|
| Compute virtualisation | VMware ESXi 5.5 type-1 hypervisor on an Intel Core i7 workstation (20 GB RAM), managed with vSphere Client |
| Storage virtualisation | FreeNAS 11 on a dedicated AMD Opteron server (SAS + SATA disks), exported to ESXi over iSCSI |
| Network virtualisation | ESXi standard vSwitch with network labels, optional VLAN IDs, and NIC teaming (active / standby) |
| Physical network | 8-port switch and a Wi-Fi access point on a shared LAN |

## Storage: FreeNAS over iSCSI

- Built ZFS volumes with the Volume Manager and created block (iSCSI) shares.
- Configured the iSCSI service step by step:
  - target global configuration;
  - portal (IP and port);
  - authorised initiators;
  - CHAP / mutual CHAP authorised access;
  - targets and device/file extents, with target–extent association to form the LUN.
- Started the service and attached the LUN to ESXi as shared storage, giving SAN-style block storage over the existing Ethernet network.

## Compute: ESXi 5.5 and vSphere

- Installed ESXi 5.5 and set the hostname, IP address, gateway, DNS and credentials.
- Created virtual machines with vSphere Client: CPU, memory and disk allocation, thick versus thin provisioning, and OS installation from ISO images held on the datastore.

## Networking: vSwitch

- Created a standard vSwitch for virtual-machine traffic, with network labels and optional VLAN IDs.
- Added a second uplink with NIC teaming (active / standby) for redundancy.

## Services hosted on the platform

| VM | Service | Work done |
|---|---|---|
| VM1 | Domain controller | Windows Server 2008 R2 with Active Directory, DNS and DHCP, providing the domain for the other services |
| VM2 | Cloud / application virtualisation | Citrix XenApp 6.5: server farm with a SQL Server data store; licensing, XML service and Receiver settings; applications published to domain users and accessed through Citrix Receiver |
| VM3 | Web server | AppServ stack (Apache, PHP, MySQL, phpMyAdmin): document root, rewrite module, PHP module and `php.ini` tuning |
| VM4 | E-mail server | Exchange Server 2013 on the AD domain: ECP / OWA, mailbox databases, user mailboxes (incl. PowerShell bulk `Enable-Mailbox`), distribution and security groups, room / equipment / shared mailboxes, send and receive connectors, transport rules and OWA policies |

## Technical background

The documentation also covers the concepts behind the implementation:

- **SDDC:** architecture, cloud management and multi-tenant trust boundaries.
- **Storage networking:** DAS, NAS and SAN; SCSI, Fibre Channel, FCIP and IP SAN; storage virtualisation.
- **Network virtualisation:** comparison with SDN, and hypervisors.
- **Virtualisation and cloud computing:** service and deployment models.
- **Mail and web servers:** SMTP, POP3 and IMAP.

---

**Author:** Mohammed Mahyoub · [Portfolio](https://mahyoub88.github.io/) · [LinkedIn](https://www.linkedin.com/in/mohammed-mahyoub/) · [ORCID](https://orcid.org/0009-0003-5640-352X)
