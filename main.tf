resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.location

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-pool"
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = 1

  management {
    auto_repair = true
  }

  node_config {
    machine_type = var.nodes_machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "${var.cluster_name}-preemptible-node-pool"
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = 2

  management {
    auto_repair = true
  }

  node_config {
    preemptible  = true
    machine_type = var.preemptible_nodes_machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
