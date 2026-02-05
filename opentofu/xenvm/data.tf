data "xenorchestra_pool" "pool" {
  name_label = "dl380g9-pool"
}

data "xenorchestra_template" "template" {
  name_label = "dl380g9 - Ubuntu 22.04" #"Ubuntu Noble Numbat 24.04"
  pool_id    = data.xenorchestra_pool.pool.id
}

data "xenorchestra_network" "net" {
  name_label = "Pool-wide network associated with eth0"
  pool_id    = data.xenorchestra_pool.pool.id
}
