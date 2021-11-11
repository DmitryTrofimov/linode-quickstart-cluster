terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.16.0"
    }
  }
}

provider "linode" {
  token = var.token
}

resource "linode_qs_cluster" "k8s_cluster" {
  k8s_version = var.k8s_version
  label       = var.label
  region      = var.region
  tags        = var.tags

  dynamic "pool" {
    for_each = var.pools
    content {
      type  = pool.value["type"]
      count = pool.value["count"]
    }
  }
}

output "kubeconfig" {
  value = linode_lke_cluster.k8s_cluster.kubeconfig
}

output "api_endpoints" {
  value = linode_lke_cluster.k8s_cluster.api_endpoints
}

output "status" {
  value = linode_lke_cluster.k8s_cluster.status
}

output "id" {
  value = linode_lke_cluster.k8s_cluster.id
}

output "pool" {
  value = linode_lke_cluster.k8s_cluster.pool
}
