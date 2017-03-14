# creates an instance in AWS
resource "aws_instance" "compliance-demo" {
  # variables declared in variables.tf to specify the base ami to create an
  # instance of (ami), the quantity of this instance (count) and also the size
  # of each instance (instance_type)
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  count                  = "${var.count}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.security_group_id}"]
  subnet_id              = "${var.subnet_id}"

  connection {
    user        = "ec2-user"
	  private_key = "${file("${var.ssh_connection_keyfile_path}")}"
  }

  provisioner "remote-exec" {
    inline = [
    "puppet apply --modulepath=/tmp/packer-puppet-masterless/module-0 --hiera_config=/tmp/packer-puppet-masterless/hiera.yaml /tmp/packer-puppet-masterless/manifests/site.pp",
    "cd /tmp/packer-puppet-masterless/module-0/compliance && /usr/local/bin/rake spec"
    ]
  }

  # metadata tagging
  tags {
      Name           = "compliance-demo-${count.index}"
      Owner          = "${var.owner}"
      Billing_Domain = "${var.billing_domain}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
