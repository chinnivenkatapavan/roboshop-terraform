
resource "null_resource" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.main]
  provisioner "local-exec" {
    command = <<EOF
az aks get-credentials --resource-group ${data.azurerm_resource_group.main.name} --name main --overwrite-existing

EOF
  }
}


resource "helm_release" "external-secrets" {
  depends_on = [null_resource.kubeconfig]
  name       = "external-secrets"
  repository = "https://charts.external-secrets.io"
  chart      = "external-secrets"
  namespace  = "kube-system"
}


resource "null_resource" "external-secrets" {
  depends_on = [helm_release.external-secrets]
  provisioner "local-exec" {
    command = <<EOF
kubectl apply -f /opt/vault-token.yml
EOF
  }
}

# Creating Argocd resources
resource "null_resource" "argocd" {
  depends_on = [null_resource.kubeconfig]
  provisioner "local-exec" {
    command = <<EOF
kubectl apply -f ${path.module}/files/argocd-ns.yml
kubectl apply -f ${path.module}/files/argocd.yml -n argocd   #"-n argocd" adding name to pods with argocd
EOF
  }
}