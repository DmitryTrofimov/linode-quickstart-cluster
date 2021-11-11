# Quickstart Project

### Pre-Install

Before you will take any actions from this list, make sure that you have required tools installed and configured on your local environment:
* [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
* [Helm](https://helm.sh/docs/intro/install/)

### Setup cluster with Terraform

Update `terraform.tfvars` file with your **linode token**. Access token can be created via linode API or manually from related [Linode Profile Settings](https://cloud.linode.com/profile/tokens)

Setup cluster:
```
$ cd ./linode-qs-cluster
$ terraform init // Setup linode provider 
$ terraform plan -out qs_cluster.tfplan // Generate plan and save it as an output file
$ terraform apply "qs_cluster.tfplan" // Apply plan and create kubernetes cluster
```

After cluster will be up and running, bind **kubeconfig** file with your local kubectl manually by downloading config file from linode or by running `./setup_kubeconfig.sh`.

Check that your binding was successful with `kubectl cluster-info` command.

Cluster can be deleted by running:
```
$ terraform plan -destroy // Delete saved terraform plan
$ terraform destroy // Delete kubernetes cluster
```
