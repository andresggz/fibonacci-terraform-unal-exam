# main.tf
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

resource "terraform_data" "fibonacci" {
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
