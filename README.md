# 🚀 Kubernetes Descheduler no AWS EKS via Terraform e Helm

Este repositório contém a configuração para **implementar o Kubernetes Descheduler** no **AWS EKS** usando **Terraform e Helm**. O Descheduler roda como um **CronJob**, redistribuindo automaticamente os pods para otimizar a alocação no cluster.

---

## 📌 O que é o Descheduler?
O **Kubernetes Descheduler** ajuda a melhorar a distribuição dos pods dentro do cluster. O Kubernetes **escalona pods apenas no momento da criação**, mas não os redistribui caso a infraestrutura mude. O Descheduler **roda periodicamente** e desaloca pods que estão mal distribuídos, permitindo que o agendador (scheduler) os posicione de forma mais eficiente.

**Benefícios do Descheduler**:
✅ **Melhor balanceamento de carga** → Evita sobrecarga de alguns nós e subutilização de outros.  
✅ **Otimização de custos** → Usa os recursos do cluster de forma eficiente.  
✅ **Maior estabilidade** → Reduz gargalos e melhora a disponibilidade dos serviços.  
✅ **Ajuste contínuo** → Diferente do kube-scheduler, que só age no deploy inicial, o Descheduler melhora a alocação ao longo do tempo.  

---

## ⚙️ Pré-requisitos
Antes de rodar esta configuração, certifique-se de que possui:

- **AWS CLI** configurado e autenticado.
- **kubectl** instalado e conectado ao cluster EKS.
- **Terraform 1.3+** instalado.
- **Helm 3+** instalado.

---

## 🏗️ Arquitetura
A configuração utiliza:

✅ **AWS EKS** como cluster Kubernetes.  
✅ **Terraform** para gerenciar a infraestrutura.  
✅ **Helm** para instalar o Kubernetes Descheduler.  
✅ **CronJob** para rodar o Descheduler periodicamente.  

---

## 🏗️ Estrutura do Projeto

```painttext
📁 terraform/
│── 📄 provider.tf         # Configuração dos providers AWS, EKS e Helm
│── 📄 variables.tf        # Definição de variáveis para customização
│── 📄 main.tf             # Código principal do Terraform para criar o Descheduler
│── 📄 outputs.tf          # Exibe informações úteis após a execução
│── 📄 terraform.tfvars    # Valores personalizados (opcional)
│── 📄 README.md           # Documentação completa do projeto
```
---
## 🚀 Como Implantar

### 1️⃣ **Clone o repositório**
```sh
git clone https://github.com/ddias00/Descheduler.git
cd kubernetes-descheduler-terraform
```

### 2️⃣ **Configure as variáveis no terraform.tfvars e iniciar o terraform**

- Edite o arquivo terraform.tfvars para personalizar a configuração
```sh
terraform init
terraform plan
terraform apply -auto-approve
```

### 🔎 **Como Verificar o Status do Descheduler**

#### Verificar se o CronJob foi criado
```sh
kubectl get cronjobs -n kube-system
```

#### Se o deploy foi bem-sucedido, o output será algo como:
```sq
NAME          SCHEDULE      SUSPEND   ACTIVE   LAST SCHEDULE   AGE
descheduler   */30 * * * *  False     0        10m            15m
```

#### Verificar logs do Descheduler
```sh
kubectl logs -l app.kubernetes.io/name=descheduler -n kube-system
```

#### Se o Descheduler estiver funcionando corretamente, você verá logs semelhantes a:
```go
I0228 10:15:23.738325       1 descheduler.go:53] Running descheduler strategies
I0228 10:15:24.341267       1 remove_duplicates.go:72] Evicting pod xyz-123 from node ip-10-0-1-45
```
---

### 📤 **Como Remover o Descheduler**

```sh
terraform destroy -auto-approve
```