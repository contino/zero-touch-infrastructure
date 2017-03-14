# zero-touch-infrastructure - Packer

Get started with Packer [here](https://www.packer.io/).


**_Build the VirtualBox Centos image:_**
1. cd into vb/centos
2. [Authenticate with the AWS appropriately](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-config-files%5D)
3. `packer build -only=virtualbox-iso vagrant_puppet.json`


**_Build the AWS RHEL image:_**
1. cd into aws/rhel
3. [Authenticate with the AWS appropriately](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-config-files%5D)
3. `packer build compliance_demo.json`
