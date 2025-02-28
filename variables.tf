variable "aws_region" {
  description = "AWS Region onde o cluster EKS está rodando"
  type        = string
}

variable "eks_cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "descheduler_cron_schedule" {
  description = "Cron schedule para a execução do Descheduler"
  type        = string
}

variable "descheduler_log_level" {
  description = "Nível de verbosidade dos logs do Descheduler (1-5, onde 1 é menos detalhado e 5 é mais detalhado)"
  type        = number
}
