#### Class wide variables ####
variable ami            { default = "" }
variable owner          { default = "" }
variable billing_domain { default = "" }


#### Compliance Demo Nodes ####
variable instance_type               { default = "t2.micro" }
variable instance_count              { default = "1" }
variable ssh_key_name                { default = "" }
variable ssh_connection_keyfile_path { default = "" }
variable subnet_id                   {}
variable security_group_id           {}
variable vpc_id                      {}

module "compliance-demo-node" {
  source = "../../../modules/compute/nodes/compliance_demo"

  # instance configuration
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  count                       = "${var.instance_count}"
  key_name                    = "${var.ssh_key_name}"
  ssh_connection_keyfile_path = "${var.ssh_connection_keyfile_path}"
  subnet_id                   = "${var.subnet_id}"
  security_group_id           = "${var.security_group_id}"
  vpc_id                      = "${var.vpc_id}"
  owner                       = "${var.owner}"
  billing_domain              = "${var.billing_domain}"
}
#####################
