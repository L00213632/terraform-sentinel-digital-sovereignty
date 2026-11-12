# terraform-sentinel-digital-sovereignty
Terraform Sentinel Policy-as-Code Framework for Digital Sovereignty and Infrastructure Supply Chain Security

@'
# Terraform Digital Sovereignty and Sentinel Policy Enforcement

## 1. Project Overview

This project demonstrates how Terraform and HashiCorp Sentinel can be used to define and evaluate infrastructure security and digital sovereignty requirements.

The project uses Terraform to describe a sample AWS infrastructure configuration in the Ireland region (`eu-west-1`). Sentinel policies evaluate the Terraform configuration and plan against defined requirements before infrastructure deployment.

The project is configured for plan-only testing. AWS resources have not been deployed.

## 2. Project Objectives

- Configure AWS infrastructure using Terraform.
- Use an approved AWS region to support data residency requirements.
- Require encryption for EBS storage.
- Require IMDSv2 for EC2 instance metadata access.
- Restrict inbound network access to HTTPS.
- Validate the AWS provider source and version.
- Evaluate Terraform plans using Sentinel policies.
- Demonstrate compliant policy evaluation through HCP Terraform.

## 3. Technologies Used

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| HCP Terraform | Remote workspace and plan execution |
| HashiCorp Sentinel | Policy as Code |
| AWS provider | AWS infrastructure resource definitions |
| PowerShell | Windows command-line execution |
| Git | Source control |

## 4. Project Architecture

Terraform configuration is stored in the `terraform` directory. It defines an EC2 instance, an encrypted EBS volume and a security group.

Sentinel policies are stored in the `sentinel` directory. They evaluate the Terraform configuration and plan.

HCP Terraform workspace:

- Organization: `ATUL0012345`
- Workspace: `digital-sovereignty-demo`

The Terraform configuration is connected to the HCP Terraform workspace through the `cloud` block in `versions.tf`.

## 5. Project Directory Structure

```text
submission-final/
├── README.md
├── .gitignore
├── evidence/
│   ├── compliant/
│   └── non-compliant/
├── reports/
│   └── technical-report.md
├── sentinel/
│   ├── sovereignty.sentinel
│   ├── supply-chain.sentinel
│   ├── compute-storage.sentinel
│   ├── network-security.sentinel
│   ├── sentinel.hcl
│   └── sentinel-mocks.hcl
├── sentinel-tests/
│   ├── compliant/
│   ├── non-compliant/
│   ├── test/
│   └── testdata/
└── terraform/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── versions.tf
    ├── .terraform.lock.hcl
    ├── tfplan
    └── tfplan.json



   ** References**

   Chatgpt- Version - GPT 6

   Phase 1: Project setup and GitHub

1. "Again I want to push this on main. Give me steps and code."
2. Instructions to organise the Terraform Digital Sovereignty project under submission-final.
3. Requests for Git commands to commit and push the assignment to the main branch.
4. Requests to resolve Git push and remote repository conflicts.
Repository: L00213632/terraform-digital-sovereignty

Phase 2: Terraform implementation

5. Requests for step-by-step Terraform assignment implementation.
6. Requests to configure the AWS provider and infrastructure.
7. Requests to validate Terraform configuration.
8. Requests to execute terraform plan.
9. Requests to connect Terraform with HCP Terraform.
10. Requests to configure the HCP Terraform workspace.
11. Requests to troubleshoot Terraform authentication and workspace permissions.

Phase 3: Sentinel policy development

        You worked on four policies:
        1. sovereignty.sentinel
        2. supply-chain.sentinel
        3. compute-storage.sentinel
        4. network-security.sentinel

12.Explain Sentinel policy implementation step by step.
13.Help configure sentinel.hcl.
14.Troubleshoot Sentinel policy syntax errors.
15.Fix the network security policy.
16.Configure Sentinel mock files.
17.Execute Sentinel policies using sentinel apply.
18.Explain how to interpret Sentinel policy results.
19.Configure all four policies as hard-mandatory.

Phase 4: HCP Terraform integration and troubleshooting
4–7 November 2026
20. Help configure the HCP Terraform organisation and workspace.
21. Resolve Terraform login and API token issues.
22. Troubleshoot insufficient permissions to generate a plan.
23. Understand remote Terraform plan execution.
24. Resolve Sentinel policy failures.
25. Correct the supply-chain policy version validation.
26. Verify all four Sentinel policy results through HCP Terraform.
27. Explain the Terraform plan output.