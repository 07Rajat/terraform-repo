# main.tf
provider "ibm" {
  region = var.region
  ignore_tags {
    key_prefixes = ["kubernetes.io/"]
  }
}

resource "ibm_container_vpc_cluster" "openshift_cluster" {
  name              = var.cluster_name
  vpc_id            = ibm_is_vpc.vpc.id
  flavor            = var.flavor
  worker_count      = var.worker_count
  resource_group_id = ibm_resource_group.group.id
  kube_version      = var.kube_version
  zones {
    subnet_id = ibm_is_subnet.subnet.id
    name      = var.zone
  }
}

resource "ibm_is_vpc" "vpc" {
  name = "${var.cluster_name}-vpc"
}

resource "ibm_is_subnet" "subnet" {
  name = "${var.cluster_name}-subnet"
  vpc  = ibm_is_vpc.vpc.id
  zone = var.zone
}

resource "ibm_resource_group" "group" {
  name = "${var.cluster_name}-rg"
}