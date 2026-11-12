# Technical Report: Final Limitations and Recommendations

**Project:** Terraform Sentinel Digital Sovereignty and Supply Chain Security  
**Date:** 12 November 2026

## 1. Introduction

This report describes the final implementation, limitations and recommendations for the Terraform Sentinel Digital Sovereignty project.

The project demonstrates how Terraform, HashiCorp Sentinel, HCP Terraform and GitHub Actions can work together to validate infrastructure configurations and evaluate security policies before deployment.

This implementation is an academic demonstration and is not a complete production deployment.

## 2. Implemented Solution

The project uses the following technologies:

- Terraform for Infrastructure as Code.
- HashiCorp Sentinel for Policy as Code.
- HCP Terraform for remote planning and policy evaluation.
- AWS provider configuration using the Ireland region (eu-west-1).
- GitHub for source-code management.
- GitHub Actions for automated validation and planning.

Four Sentinel policies were implemented:

1. Digital Sovereignty: Checks whether the AWS region is approved.
2. Supply Chain Security: Checks provider source and version information.
3. Compute and Storage Security: Checks instance types, IMDSv2 and EBS encryption.
4. Network Security: Checks for unrestricted inbound SSH access.

The GitHub Actions workflow automatically starts when changes are pushed to the main branch. It performs Terraform formatting, initialisation, validation and a speculative plan through HCP Terraform.

## 3. Final Limitations

### 3.1 Plan-Only Implementation

The project performs Terraform planning and Sentinel policy evaluation but does not deploy AWS infrastructure.

The workflow intentionally does not execute terraform apply. Successful pipeline execution confirms that the configuration passed the implemented validation and policy checks. It does not confirm that infrastructure was deployed successfully.

### 3.2 Demonstration AWS Credentials

Dummy AWS credentials and provider validation settings are used for plan-only testing.

These settings are not suitable for production deployment. A real implementation requires secure AWS authentication, appropriate IAM permissions and short-lived credentials wherever possible.

### 3.3 Sentinel Enforcement Levels

The HCP Terraform policy set currently configures the digital sovereignty policy as hard-mandatory. The other three policies are advisory.

Advisory policies provide evaluation feedback but do not independently prevent a Terraform run from proceeding.

For stronger security, all four policies should be reviewed and configured as hard-mandatory after successful testing.

### 3.4 Digital Sovereignty Limitations

The current sovereignty policy checks the configured AWS region against an approved list.

However, selecting an approved region alone cannot guarantee complete data residency. Backups, replication, logging, disaster recovery, support access and third-party services must also be considered.

### 3.5 Supply Chain Security Limitations

Provider version pinning helps maintain consistency but does not independently guarantee that downloaded provider binaries are safe.

The current implementation does not provide complete software bill of materials generation, vulnerability scanning, binary signature verification or continuous dependency monitoring.

### 3.6 Network Security Limitations

The project includes example network security configurations.

The CIDR range 203.0.113.0/24 is reserved for documentation and is not a real production access range. Actual production network rules must use approved and verified IP ranges.

### 3.7 No Continuous Infrastructure Monitoring

Sentinel evaluates infrastructure information during Terraform runs.

It does not continuously monitor deployed AWS resources or automatically detect every change made outside Terraform.

Additional drift detection and monitoring would be required for production environments.

### 3.8 Plan Review and Resource Changes

A successful Terraform plan does not automatically mean that every proposed infrastructure change is safe.

The demonstration has shown a plan summary of three resources to add, zero to change and one to destroy. These are proposed changes only. The deletion must be investigated before any future deployment.

## 4. Recommendations

The following improvements are recommended for future development.

| Area | Recommendation | Priority |
|---|---|---|
| AWS Authentication | Replace dummy credentials with secure, short-lived AWS authentication using OIDC where supported. | High |
| Sentinel Policies | Review and configure all four HCP policies as hard-mandatory after testing. | High |
| API Security | Restrict access to the HCP Terraform API token and rotate it regularly. | High |
| Terraform Changes | Review all proposed additions, modifications and deletions before deployment. | High |
| Policy Testing | Add automated tests for compliant and non-compliant Sentinel scenarios. | Medium |
| Supply Chain | Introduce dependency scanning, provider provenance checks and SBOM generation. | Medium |
| Data Sovereignty | Review backups, replication, logging and service-specific data handling. | Medium |
| Network Security | Replace example CIDR values with approved production network ranges. | Medium |
| Infrastructure Monitoring | Introduce drift detection and continuous compliance monitoring. | Medium |
| Notifications | Add notifications for failed GitHub Actions workflows and policy evaluations. | Low |

## 5. Recommended Future Automation Workflow

A future production implementation could follow this process:

1. A developer makes a code change and pushes it to GitHub.
2. GitHub Actions automatically starts the CI/CD workflow.
3. The pipeline checks Terraform formatting and validates the configuration.
4. Sentinel policy tests check compliant and non-compliant scenarios.
5. Terraform generates a speculative plan through HCP Terraform.
6. HCP Terraform evaluates the configured Sentinel policies.
7. The team reviews the plan and policy evaluation results.
8. An authorised person approves any future deployment.
9. Terraform applies the approved infrastructure changes.
10. Monitoring and drift detection continuously review the deployed infrastructure.

The current academic implementation completes the automated validation, planning and policy-evaluation stages. Deployment approval, infrastructure application and continuous monitoring are recommendations for future development.

## 6. Conclusion

This project demonstrates the use of Infrastructure as Code and Policy as Code to improve cloud security and governance.

Terraform provides infrastructure configuration, Sentinel evaluates security policies, HCP Terraform manages remote planning and policy checks, and GitHub Actions automates the validation workflow.

The main limitations include the plan-only implementation, demonstration credentials, mixed policy enforcement levels and the absence of continuous infrastructure monitoring.

The recommended improvements provide a foundation for developing a more secure, automated and production-ready cloud infrastructure governance solution.

**Important:** The current demonstration is plan-only. Do not execute terraform apply as part of this assignment.
