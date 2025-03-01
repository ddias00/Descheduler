resource "helm_release" "descheduler" {
  name       = "descheduler"
  namespace  = "kube-system"
  chart      = "descheduler"
  repository = "https://kubernetes-sigs.github.io/descheduler"
  version    = "0.32.2"

  # Define o intervalo de execução do CronJob
  set {
    name  = "schedule"
    value = var.descheduler_cron_schedule
  }

  # Define o nível de logs
  set {
    name  = "cmdOptions.v"
    value = var.descheduler_log_level
  }
}
