# variables.tf
variable "ibm_api_key" {
  description = "IBM Cloud API key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "region for schematics, e.g. us-south or eu-de"
  type        = string
  default     = "us-east"
}

variable "resource_group_list" {
  description = "Set of names of resource groups to create (besides the default group - `account - do not use`)"
  type        = set(string)
  default     = ["devops", "central"]
}

variable "create_sre_vpc" {
  description = "Flag, whether to create a VPC in SRE resource group (1 = yes, 0 = no)"
  type        = number
  default     = 1
}

variable "create_sre_roks" {
  description = "Flag, whether to create a ROKS cluster in SRE resource group (1 = yes, 0 = no)"
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "The flavor of VPC worker node to use for your cluster. Use `ibmcloud ks flavors` to find flavors for a region."
  type        = string
  default     = "mx2.8x64"
}

variable "workers_per_zone" {
  description = "Number of workers to provision in each zone"
  type        = number
  default     = 2
}

variable "kube_version" {
  description = "Specify the Kubernetes version, including the major.minor version. To see available versions, run `ibmcloud ks versions`."
  type        = string
  default     = "4.17.14_openshift"

  validation {
    error_message = "To create a ROKS cluster, the kube version must include `openshift`."
    condition     = can(regex(".*openshift", var.kube_version))
  }
}

variable "cluster_name" {
  description = "Name of the OpenShift cluster"
  type        = string
  default     = "my-openshift-cluster"
}

variable "zone" {
  description = "Zone for the cluster"
  type        = string
  default     = "us-south-1"
}