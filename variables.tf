variable "cluster_name" {
  default = "my-cluster"
}

variable "location" {
  type    = string
  default = "us-west1-a"
}

variable "preemptible_nodes_machine_type" {
  type    = string
  default = "e2-small"
}

variable "preemptible_node_count" {
  type    = number
  default = 3
}
