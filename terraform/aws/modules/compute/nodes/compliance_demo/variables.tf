########### AWS Instance 'demo-node' resource variables #############
### the variables in this file are passed in at environment level ###

# instance variables
variable ami                         { default = "" }
variable instance_type               { default = "t2.micro" }
variable count                       { default = "1" }
variable key_name                    { default = "" }
variable ssh_connection_keyfile_path { default = "" }
variable subnet_id                   {}
variable security_group_id           {}
variable vpc_id                      {}

# tag variables
variable owner          { default = "" }
variable dependencies   { default = [""] } # example tag variable, non-critical value
variable billing_domain { default = "" }
