resource "harness_platform_connector_kubernetes" "clientKeyCert" {
  identifier  = "kubegabstf"
  name        = "kube-gabs-tf"
  description = "terraform labs"
  tags        = ["foo:bar"]

  client_key_cert {
    master_url                = "https://192.168.15.100:6443"
    ca_cert_ref               = "account.gabsk8sclientcertca"
    client_cert_ref           = "account.gabsk8sclientcert"
    client_key_ref            = "account.gabsk8sclientkey"
    client_key_algorithm      = "RSA"
  }

  delegate_selectors = ["gabs-manual-k8s-virtualbox"]
}