# Terraform Digital Sovereignty and IaC Supply Chain Security
    Technical Submission Report | Organization: ATUL0012345 | 

1. Introduction and objective
   
In this assignment we are designing Policy-as-Code framework using Terraform, Hashi-Corp Sentinel and HCP Terraform. Objective of this assignment is to design a framework to help an organization apply digital sovereignty and infrastructure security requirements prior infrastructure changes can be approved for deployment. 

2. Implementation
   
In this Terraform is used to define sample AWS environment in Ireland, Europe region which is “eu-west-1”. As mention in assignment configuration includes an EC2 instance, as an encrypted EBS volume and a security group with restricted access HTTPS access for designed region.
	
In this, four Sentinel policies are designed and developed are as follows:
•	Sovereignty policy – 
o	This policy is mainly designed to check the AWS deployment uses the approved geographical region.

•	Supply-chain policy – 
o	This policy checks the approved AWS provider source and mentioned provider version, as well as module information where applicable.

•	Compute and storage policy – 
o	Checks permitted EC2 instance types, mandatory IMDSv2 and EBS encryption.

•	Network security policy –
o	 Checks that inbound SSH access is not open to everyone on the internet.

These policies are developed for infrastructure configuration through which deployment is approved against defined requirements.

3. Validation and results

All the policies which are designed for this infrastructure are integrated with HCP Terraform workplace as digital-sovereignty-demo

For testing, two validations designed and completed successfully. In first scenario, as the configuration is designed and approved only for Ireland “eu-west-1” region, displays successful Sentinel results in HCP Terraform and all four policies are passed. 

For the second scenario, AWS region is updated temporarily to an unapproved region. After which Sentinel returns a failed result because the sovereignty requirement was violated. HCP Terraform shows an organization policy check failure, preventing the plan from processing. At the end default configuration was restored after testing. 

Screenshots and execution logs for both scenarios are included in the project's evidence directory.

4. Limitations and recommendations
   
This Policy-as-Code implementation demonstrates how policy evaluation works during Terraform planning. It does not deploy resources to AWS. The HCP Terraform policy set currently has the sovereignty policy configured as hard-mandatory, while the other three policies are advisory

However, a geographical restriction cannot assure complete data and access sovereignty. Other factors are there which mandatory to be considered such as backup location, replication, administrative access and applicable legal requirements. Mentioning provider version is more essential and useful, though additional verification needed to be established software and module trustworthiness. Continuous monitoring is also mandatory because infrastructure can be changed after deployment. 

In production environment, all validated security policies need to be configured with appropriate mandatory requirements.  Regular infrastructure monitoring, dependency scanning, and policy reviews should be conducted. 

5. Conclusion
   
This project demonstrates how Terraform and Sentinel can collaborate to verify infrastructure against organizational environments. The successful and failed HCP Terraform evaluations show how policy checks can identify non-compliant configurations and prevent a plan that violates a mandatory rule from proceeding.
