# FreeNAS 11 — iSCSI block storage for ESXi

Order of configuration in the FreeNAS web UI (Sharing → Block (iSCSI)):

| Step | Where | What was set |
|---|---|---|
| 1 | Storage → Volumes → Volume Manager | ZFS volume built from the server's disks (2 × 73 GB 15k SAS + 160 GB SATA) |
| 2 | Target Global Configuration | Base name / global iSCSI settings |
| 3 | Portals → Add Portal | IP address and port the target listens on |
| 4 | Initiators → Add Initiator | Initiators (ESXi host) and networks authorised to connect |
| 5 | Authorized Access | CHAP / mutual-CHAP user and secret |
| 6 | Targets → Add Target | Target name, portal group, initiator group, auth method |
| 7 | Extents → Add Extent | Device or file extent backing the LUN |
| 8 | Associated Targets → Add Target/Extent | Target ↔ extent association (forms the LUN) |
| 9 | Services → iSCSI → Start | Service enabled; LUN discovered from ESXi and added as a datastore |
