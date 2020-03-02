variable "cluster_name" {
  default = "my-cluster"
}

variable "location" {
  type    = string
  default = "us-west1-a"
}

variable "nodes_machine_type" {
  type    = string
  default = "f1-micro"
}

variable "preemptible_nodes_machine_type" {
  type    = string
  default = "n1-standard-1"
}
