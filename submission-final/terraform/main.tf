resource "terraform_data" "digital_sovereignty_demo" {
  input = {
    organization = "ATUL0012345"

    project = "Digital Sovereignty"

    environment = "Ireland"

    approved_region = "eu-west-1"

    data_residency = "Ireland-EU"

    encryption_required = true

    imdsv2_required = true

    ssh_restricted = true

    provider_source = "registry.terraform.io/hashicorp/aws"

    provider_version = "5.0.0"

    module_source = "github.com/example/secure-module"

    module_version = "1.0.0"
  }
}