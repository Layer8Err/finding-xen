# Finding-Xen

This project contains information and scripts for getting started with Xen.

## Quick Links

* [XCP-ng ISO download](https://xcp-ng.org/#easy-to-install)
* [Xen Orchestra install](https://xen-orchestra.com/docs/installation.html#from-the-sources)
* [Xen Orchestra Installer / Updater](https://github.com/ronivay/XenOrchestraInstallerUpdater)

## Clone this Repo

You can clone this repo with the following command:

```bash
git clone https://github.com/Layer8Err/finding-xen.git
```

## Quick Start

Clone the Xen Orchestra Installer / Updater repo:

```bash
git clone https://github.com/ronivay/XenOrchestraInstallerUpdater.git
```

Create `xo-install.cfg` file using sample file.

```bash
cp sample.xo-install.cfg xo-install.cfg
```

Modify the `xo-install.cfg` file:
* Change `PORT="80"` to `PORT="443"`
* Uncomment PATH_TO_HTTPS_* for `xo.crt` and `xo.key` ($INSTALLDIR by default points at `/opt/xo`)

Create certificate and key file for the install using openssl:

```bash
sudo openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /opt/xo/xo.crt -keyout /opt/xo/xo.key
```

Run the `xo-install.sh` script and select the "Install" option from the menu.

The same `xo-install.sh` script can also be used to update the Xen Orchestra installation.

## Set up XOA on new XCP-ng host

```bash
bash -c "$(curl -sS http://xoa.io/deploy)"
```
