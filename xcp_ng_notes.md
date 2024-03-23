# Notes

[XenServer Product documentation](https://docs.xenserver.com/en-us/citrix-hypervisor/quick-start)

## Networking

Set MTU

```bash
xe network-list
xe network-param-set uuid=xxx MTU=1504
```

Change will require XCP-ng host reboot.

### Create VLANs

```bash
# Network for use with VLAN2
xe network-create name-label=vlan2

# Find UUID of PIF corresponding to physical NIC
# NOTE: NIC must already have the appropriate VLAN tag(s)
xe pif-list

# Create VLAN object
xe vlan-create network-uuid=<network_uuid> pif-uuid=<pif_uuid> vlan=2
```

### Create NIC bond

```bash
# Network for use with bonded NIC
xe network-create name-label=bond0

# Determine UUIDs of PIFs to use in the bond
xe pif-list

# Configure bond type
## active-active (default)
xe bond-create network-uuid=<network_uuid> /
    pif-uuids=<pif_uuid_1>,<pif_uuid_2>

## LACP
xe bond-create network-uuid=<network_uuid> pif-uuids=<pif_uuid_1>, /
    <pif_uuid_2> mode=lacp
```

### Network Purpose

```bash
# Create purpose "storage"
xe network-param-add param-name=storage param-key=storage uuid=<network-uuid>

# Remove "storage" purpose
xe network-param-remove param-name=storage param-key=<storage> uuid=<network-uuid>
```
