locals {
  csv_data = file("${path.module}/clusters.csv")
  providers = csvdecode(local.csv_data)
}

resource "harness_platform_connector_kubernetes" "clientKeyCert" {
  for_each = { for inst in local.providers : inst.name => inst }
  
  identifier  = "${each.key}"
  name        = "kubernetes-${each.key}"
  description = "terraform labs"
  tags        = ["foo:bar"]

  client_key_cert {
    master_url                = "${each.value.master_url}"
    ca_cert_ref               = "${each.value.ca_cert_ref}"
    client_cert_ref           = "${each.value.client_cert_ref}"
    client_key_ref            = "${each.value.client_key_ref}"
    client_key_algorithm      = "${each.value.client_key_algorithm}"
  }

  delegate_selectors = ["${each.value.delegate_selector}"]
}