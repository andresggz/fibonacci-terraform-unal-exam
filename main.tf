# main.tf
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

provider "null" {}

resource "null_resource" "fibonacci" {
  provisioner "local-exec" {
    command = <<EOT
      #!/bin/bash
      a=0
      b=1
      echo -n "$a $b "
      for i in {2..8}
      do
        fn=$((a + b))
        echo -n "$fn "
        a=$b
        b=$fn
      done
    EOT
  }
}
