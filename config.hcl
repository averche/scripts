listener "tcp" {
  address     = "[::]:8200"
  tls_disable = "true"
}

storage "inmem" {}
