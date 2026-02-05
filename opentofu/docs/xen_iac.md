# Xen as IaC

The [Xen Orchestra provider](https://registry.terraform.io/providers/vatesfr/xenorchestra/latest/docs)
can be used to interact with resources
supported by [Xen Orchestra](https://github.com/vatesfr/xen-orchestra).

## Required Info

Before deploying a VM, you will need to have some information about your Xen environment.

* Pool: You will need to know the name of your VM pool where the VM will run
* Storage: you will need to get the UUID of the Storage Resource to be used by your VM's disk
* Template: you will need to choose a template to be used when creating your VM
* Network: you will need to get the name of the network that you want your VM to be attached to

## Environment Prep

Prepare your environment variables, or define values when running `tofu plan`.

* `XOA_USER`: XOA username with permission to create resources
* `XOA_PASSWORD`: password used by XOA user with permission to create resources
* `XOA_URL`: use 'wss://myxoa_host.domain' if https, or 'ws://myxoa_host.domain' if using http
* `XOA_INSECURE`: set to `"true"` if you are using self-signed certificates

## Creating your test VM

Once environment variables have been set and terraform files have been updated to use the appropriate values for your environment, a new VM can be created.

```bash
# Switch to xenvm folder
cd opentofu/xenvm
# Prepare providers
tofu init
# Run plan (will throw errors if invalid values are detected)
tofu plan
# Apply the plan to create a new VM
tofu apply
```

## Cleaning up

Once you are done creating a VM, you can quickly clean up the VM with the following command:

```bash
tofu destroy
```
