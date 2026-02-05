#https://registry.terraform.io/providers/vatesfr/xenorchestra/latest/docs/resources/vm
#
resource "xenorchestra_cloud_config" "cloud-config" {
  name = "cloud config"
  template = templatefile("cloud_config.tftpl", {
    hostname = "testvm"
    domain   = "layer8.pro"
  })
}

resource "xenorchestra_vm" "testvm" {
  memory_max = 6442450944
  # memory_min       = 6442450944
  cpus = 2

  cloud_config                        = xenorchestra_cloud_config.cloud-config.template
  destroy_cloud_config_vdi_after_boot = true # remove cloud config once VM is booted

  name_label       = "testvm"
  name_description = "test vm"
  template         = data.xenorchestra_template.template.id

  auto_poweron      = false
  hvm_boot_firmware = "bios" # | "uefi"
  secure_boot       = false

  power_state = "Running" # Halted, Paused, Suspended

  #installation_method = "network" #  Allows PXE booting

  affinity_host = data.xenorchestra_pool.pool.master
  network {
    network_id = data.xenorchestra_network.net.id
  }

  disk {
    sr_id      = "b1391e03-265f-2a03-3831-d6a82c6cf4d3" # Storage repo ID
    name_label = "Ubuntu2204_imavo"
    size       = 17179869184 # bytes (16GiB)
  }

  tags = [
    "Ubuntu",
    "Noble",
  ]

  timeouts {
    create = "20m"
  }
}
