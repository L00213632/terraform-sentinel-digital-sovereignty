# Terraform Sentinel Digital Sovereignty and Supply Chain Security

## 1. Project Overview

This project implements a Policy as Code framework using Terraform, HashiCorp Sentinel, HCP Terraform and GitHub. The objective is to demonstrate how cloud infrastructure can be checked against digital sovereignty, supply-chain security, compute, storage and network-security requirements before deployment.

The demonstration uses an Ireland-based AWS region and the organisation ATUL0012345.

## 2. Technology Stack

- Terraform: Infrastructure as Code.
- HashiCorp Sentinel: Policy as Code.
- HCP Terraform: Remote Terraform planning and Sentinel policy evaluation.
- AWS provider: Infrastructure configuration for the demonstration.
- GitHub: Source-code version control and project history.

## 3. Project Structure

- terraform/: Terraform configuration, provider lock file and infrastructure resources.
- sentinel/: Sentinel policies and policy configuration.
- sentinel-tests/: Sentinel test data and mock configurations.
- evidence/compliant/: Successful policy evaluation log and screenshot.
- evidence/non-compliant/: Failed policy evaluation log and screenshot.
- reports/: Technical report describing limitations and recommendations.
- README.md: Project documentation.

## 4. Sentinel Policies

Four policies were developed:

### 4.1 Digital Sovereignty
File: sovereignty.sentinel

Checks that the AWS provider uses an approved region. The approved regions are eu-west-1, eu-west-2 and eu-central-1.

### 4.2 Supply Chain Security
File: supply-chain.sentinel

Checks the approved Terraform AWS provider source and pinned provider version. It also checks module source and version information where modules are configured.

### 4.3 Compute and Storage Security
File: compute-storage.sentinel

Checks approved EC2 instance types, mandatory IMDSv2 and EBS encryption.

### 4.4 Network Security
File: network-security.sentinel

Checks security group ingress rules to prevent unrestricted inbound SSH access from 0.0.0.0/0 or ::/0.

## 5. HCP Terraform Integration and Enforcement

The Terraform configuration is connected to the HCP Terraform organisation ATUL0012345 and workspace digital-sovereignty-demo.

The HCP Terraform policy set used for the demonstration has the sovereignty policy configured as hard-mandatory. The other three policies are configured as advisory in the HCP policy set.

The local sentinel.hcl file specifies hard-mandatory enforcement for all four policies. However, the local configuration does not automatically change the enforcement settings of the separately managed HCP Terraform policy set.

A hard-mandatory policy failure prevents the plan from proceeding.

## 6. Testing and Evidence

Two HCP Terraform policy evaluation scenarios were captured.

### Compliant scenario

The configuration used the approved AWS region eu-west-1.

The HCP Terraform run returned Sentinel Result: true. All four policies passed their evaluations.

Evidence is available in evidence/compliant/.

### Non-compliant scenario

The AWS region was temporarily changed to an unapproved region for testing.

The HCP Terraform run returned Sentinel Result: false. The sovereignty policy failed because the region was outside the approved list. HCP Terraform reported an Organization Policy Check hard failure.

The other three advisory policies passed.

The original compliant configuration was restored after the test.

Evidence is available in evidence/non-compliant/.

## 7. Security and Implementation Limitations

- The project demonstrates plan-time policy evaluation and does not deploy AWS resources.
- Dummy AWS credentials and provider validation settings are used for plan-only testing. They must not be used for production deployment.
- The example network CIDR 203.0.113.0/24 is a documentation address range, not a real production access allowlist.
- Region checks alone cannot guarantee data residency. Backups, replication, support access, service-specific data handling and legal jurisdiction must also be reviewed.
- Provider version pinning does not independently prove the integrity or trustworthiness of provider binaries.
- Module provenance and external supply-chain risks require additional controls, such as trusted registries, source verification and dependency scanning.
- Sentinel evaluates information available during a Terraform run. It cannot independently guarantee that deployed infrastructure remains compliant after deployment.
- The current HCP enforcement configuration makes only the sovereignty policy hard-mandatory. The other policies provide advisory feedback and should be changed to hard-mandatory after appropriate validation if strict enforcement is required.

## 8. Running the Demonstration

1. Review the Terraform files in the terraform directory.
2. Review the Sentinel policies and sentinel.hcl in the sentinel directory.
3. Connect Terraform to the appropriate HCP Terraform workspace.
4. Run a Terraform plan.
5. Review the Sentinel policy evaluation results in HCP Terraform.
6. Compare the compliant and non-compliant logs in the evidence directory.

Do not run terraform apply for this demonstration.

## 9. Generative AI Disclosure

OpenAI ChatGPT, model: GPT-6, was used as an assistance tool during the project.

Example prompts included:
- Explain how to create and configure Terraform Sentinel policies for digital sovereignty.
- Help troubleshoot Terraform and HCP Terraform integration errors.
- Explain Sentinel policy evaluation results and non-compliant plan failures.
- Help organise project documentation and testing evidence.

AI assistance was used for explanations, troubleshooting and documentation support. The project configuration, testing and verification were carried out as part of the implementation process. The submitted code and results should be reviewed by the student for correctness and understanding.
