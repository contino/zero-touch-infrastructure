# outputs produced at the end of a terraform apply: id of the instances, id of
# security group(s) they are part of
output "compliance_demo_id"    { value = "${module.compliance-demo-node.compliance_demo_instance_id}" }
output "compliance_demo_ip"    { value = "${module.compliance-demo-node.compliance_demo_ip}" }
output "compliance_demo_sg_id" { value = "${module.compliance-demo-node.compliance_demo_sg_id}" }
