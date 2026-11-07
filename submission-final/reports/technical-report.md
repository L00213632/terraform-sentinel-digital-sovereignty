# Technical Report: Terraform Sentinel Digital Sovereignty

## 1. Implementation Summary

This project demonstrates a Policy as Code framework using Terraform, HashiCorp Sentinel and HCP Terraform. Its purpose is to evaluate cloud infrastructure plans against digital sovereignty and security requirements before deployment.

Four Sentinel policies were implemented:

- **Sovereignty:** restricts AWS deployments to approved regions, including eu-west-1.
- **Supply-chain security:** checks the approved AWS provider source and pinned version, along with module information where applicable.
- **Compute and storage:** checks approved EC2 instance types, mandatory IMDSv2 and EBS encryption.
- **Network security:** detects unrestricted inbound SSH access from public IPv4 and IPv6 ranges.

The Terraform configuration was connected to the HCP Terraform organisation ATUL0012345 and workspace digital-sovereignty-demo.

## 2. Testing and Results

Two HCP Terraform runs were recorded.

The compliant test used the approved AWS region eu-west-1. Sentinel returned **true**, and all four policies passed.

The non-compliant test used an unapproved AWS region. Sentinel returned **false**, and the hard-mandatory sovereignty policy failed. HCP Terraform reported an organisation policy check failure and blocked the plan from proceeding. The other three advisory policies passed.

The original compliant configuration was restored after the negative test. Both run logs and screenshots are included in the evidence directory.

## 3. Limitations

The implementation demonstrates plan-time policy evaluation and does not deploy resources to AWS. The HCP policy set currently enforces only the sovereignty policy as hard-mandatory; the other three policies are advisory.

Region restrictions alone cannot guarantee data sovereignty. Data replication, backup locations, administrative access, service-specific data handling and legal jurisdiction must also be considered. Provider version pinning does not prove software provenance or eliminate supply-chain compromise. Sentinel also cannot independently guarantee that infrastructure remains compliant after deployment.

The example security group uses the documentation CIDR range 203.0.113.0/24 and is not a production access-control configuration. Dummy AWS credentials and provider validation skips are used only for plan testing.

## 4. Recommendations

Before production adoption, configure all validated security policies as hard-mandatory in HCP Terraform. Extend residency controls to cover backups, replication and access locations. Use trusted provider and module sources, verify dependency provenance, and introduce vulnerability and dependency scanning. Apply continuous monitoring and periodic policy reviews to identify configuration drift and changing regulatory requirements.

## 5. Conclusion and AI Disclosure

The demonstration shows how Sentinel can evaluate Terraform plans and prevent a plan that violates a hard-mandatory regional policy from proceeding. The compliant and non-compliant runs provide evidence of this behaviour.

OpenAI ChatGPT (GPT-6) assisted with explanations, troubleshooting and documentation. The student is responsible for reviewing and understanding the submitted implementation and results.
