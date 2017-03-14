# outputs produced at the end of a terraform apply: id of the instances, id of
# security group(s) they are part of
output "compliance_demo_instance_id" { value = ["${aws_instance.compliance-demo.*.id}"] }
output "compliance_demo_ip"          { value = ["${aws_instance.compliance-demo.*.public_ip}"] }
