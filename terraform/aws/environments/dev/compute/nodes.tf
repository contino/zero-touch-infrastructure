#### Class wide variables ####
variable ami   { default = "" }
variable owner { default = "" }


#### Compliance Demo Nodes ####
variable instance_type  { default = "t2.micro" }
variable instance_count { default = "1" }
variable ssh_key_name   { default = "" }
variable subnet_id      {}
variable vpc_id         {}

module "compliance-demo-node" {
  source = "../../../modules/compute/nodes/compliance_demo"

  # instance configuration
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  count         = "${var.instance_count}"
  key_name      = "${var.ssh_key_name}"
  subnet_id     = "${var.subnet_id}"
  vpc_id        = "${var.vpc_id}"

  owner         = "${var.owner}"
}
#####################
