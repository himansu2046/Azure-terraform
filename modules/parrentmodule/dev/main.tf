module "rg" {
  source = "../../childmodule/rg"
  rgs    = var.rgs

}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../childmodule/vnet"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../childmodule/subnet"
  subnets    = var.subnets

}

module "nic" {
  depends_on  = [module.subnet]
  source      = "../../childmodule/nic"
  nics        = var.nics
  subnet_data = var.subnets

}
module "linux_vm" {
  depends_on = [module.nic]
  source     = "../../childmodule/vm"
  vms        = var.vms
  nic_data   = var.nics
}
