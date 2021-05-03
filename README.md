# Splunk Cluster in Terraform

An example Splunk cluster in Terraform.

- Uses the official Splunk AMI
- Provisions a captain, multiple peered indexes, and search heads, spread across multiple subnets
- uses the Splunk API to configure the application (indexes, users, apps etc)
- Splunk 8.x

## Relevant links and examples

Splunk Enterprise Quickstart in Cloudformations:

https://github.com/aws-quickstart/quickstart-splunk-enterprise

A similar, though older, example in Terraform:

https://github.com/Shaiou/Terraform-Splunk
