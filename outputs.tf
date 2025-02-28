output "descheduler_name" {
  description = "Nome do Helm Release do Descheduler"
  value       = helm_release.descheduler.name
}

output "descheduler_namespace" {
  description = "Namespace onde o Descheduler está rodando"
  value       = helm_release.descheduler.namespace
}

output "eks_cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = data.aws_eks_cluster.eks.endpoint
}
