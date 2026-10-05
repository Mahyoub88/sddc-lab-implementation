# Software-Defined Data Center (SDDC) — Design & Implementation — Engineering Guide

Designed and implemented a working software-defined data center on physical hardware, virtualising compute, storage and networking and hosting directory, cloud-application, web and e-mail services.

## Visual overview

![Functional overview](overview/architecture.svg)

*New explanatory diagram; grouped responsibilities, not an as-built schematic or test result.*

![Engineering workflow](overview/workflow.svg)

*New explanatory workflow; a documentation aid, not evidence that every proposed check was performed.*

## Storage-to-service dependency

FreeNAS exports ZFS-backed storage as an iSCSI target; ESXi attaches the LUN as a datastore. Virtual machines then use compute and network resources to host directory, application-delivery, web and email services. This dependency chain makes storage faults visible far above the storage layer.

## Networking and identity

A standard vSwitch provides VM connectivity and active/standby NIC teaming. AD, DNS and DHCP support domain users and service discovery; Citrix, the AppServ stack and Exchange provide distinct application services. Configuration screenshots document the integration steps.

## Reading historical configurations

Version numbers describe the documented implementation. The repository is a record of the engineering work, not a recommendation to expose those historical server versions as a new public production deployment. The new diagram is a simplified logical view.

## Evidence to review or collect

The following are suggested review checks. A checklist entry is not a claimed pass result.

- iSCSI target/LUN/datastore chain.
- VM resource and vSwitch configuration.
- Directory/DNS and application access.
- Storage/network interruption and recovery evidence.

## Source gallery

![lab architecture](images/01-lab-architecture.jpg)

*lab architecture.*

![freenas volume manager](images/02-freenas-volume-manager.png)

*freenas volume manager.*

![freenas iscsi portal initiators](images/03-freenas-iscsi-portal-initiators.png)

*freenas iscsi portal initiators.*

![freenas iscsi target extent](images/04-freenas-iscsi-target-extent.png)

*freenas iscsi target extent.*

![esxi install](images/05-esxi-install.png)

*esxi install.*

![esxi static ip](images/06-esxi-static-ip.png)

*esxi static ip.*

![esxi dns hostname](images/07-esxi-dns-hostname.png)

*esxi dns hostname.*

![esxi configured](images/08-esxi-configured.png)

*esxi configured.*

![vsphere client login](images/09-vsphere-client-login.png)

*vsphere client login.*

![vsphere host inventory](images/10-vsphere-host-inventory.png)

*vsphere host inventory.*

![vm hardware settings](images/11-vm-hardware-settings.png)

*vm hardware settings.*

![vswitch created](images/12-vswitch-created.png)

*vswitch created.*

![nic teaming failover order](images/13-nic-teaming-failover-order.png)

*nic teaming failover order.*

![xenapp license server](images/14-xenapp-license-server.png)

*xenapp license server.*

![xenapp sql data store](images/15-xenapp-sql-data-store.png)

*xenapp sql data store.*

![xenapp published apps](images/16-xenapp-published-apps.png)

*xenapp published apps.*

![citrix web interface login](images/17-citrix-web-interface-login.png)

*citrix web interface login.*

![citrix published app running](images/18-citrix-published-app-running.png)

*citrix published app running.*

![apache server settings](images/19-apache-server-settings.png)

*apache server settings.*

![mysql instance config](images/20-mysql-instance-config.png)

*mysql instance config.*

![sanaa website served](images/21-sanaa-website-served.jpg)

*sanaa website served.*

![exchange powershell](images/22-exchange-powershell.png)

*exchange powershell.*

![exchange send connector](images/24-exchange-send-connector.png)

*exchange send connector.*


## Sources and provenance

- [Published portfolio description](https://mahyoub88.github.io/#proj-sddc-lab).
- [Project README](../README.md) and existing repository files.
- [LinkedIn projects](https://www.linkedin.com/in/mohammed-mahyoub/details/projects/): supplementary descriptions and project media.
- New SVG figures and explanatory text were authored for this documentation update; they are not original photographs or new measured results.
