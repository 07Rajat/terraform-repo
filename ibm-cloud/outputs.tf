# outputs.tf
output "cluster_id" {
  description = "ID of the OpenShift cluster"
  value       = ibm_container_vpc_cluster.openshift_cluster.id
}

output "cluster_name" {
  description = "Name of the OpenShift cluster"
  value       = ibm_container_vpc_cluster.openshift_cluster.name
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = ibm_is_vpc.vpc.id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = ibm_is_subnet.subnet.id
}

output "resource_group_id" {
  description = "ID of the resource group"
  value       = ibm_resource_group.group.id
}