# Workload Identity Federation in GCP using Terraform

This repository provides a Terraform script to create and configure Workload Identity Federation (WIDF) in Google Cloud Platform (GCP). The setup includes a Workload Identity Pool, Provider, Service Account, and IAM bindings.

## Prerequisites

- Terraform installed.

- A GCP project with billing enabled.

- A valid service account key file (key.json).

## Features

- Creates a Workload Identity Pool.

- Adds an OIDC Provider to the pool.

- Creates a Service Account.

- Binds the Service Account to the Workload Identity Pool.

- Assigns necessary IAM roles.

## Files

``main.tf``

Contains the Terraform configuration to create the resources.

``variables.tf``

Defines all variables required for the script.

## Usage

### 1. Clone the Repository

``git clone https://github.com/<your-username>/<your-repo-name>.git``<br>
``cd <your-repo-name>``

### 2. Set Up Variables

Create a ``terraform.tfvars`` file and define the required variables:

```
project_id          = "your-gcp-project-id"
impersonated-sa     = "your-impersonated-service-account"
sa_id_suffix        = "your-service-account-id-suffix"
pool_id_suffix      = "your-pool-id-suffix"
display_name_pool   = "Workload Identity Pool"
description_for_pool = "Description for Workload Identity Pool"
pool_status         = false
provider_id         = "your-provider-id"
display_name_provider = "OIDC Provider"
attribute_condition = "<your-attribute-condition>"
description_for_provider = "Description for the Provider"
attribute_mapping   = {
  "google.subject" = "assertion.sub"
}
oidc_issuer_uri     = "https://example.com"
wid_role            = "roles/iam.workloadIdentityUser"
member_sa           = "serviceAccount:"
member              = "principalSet://iam.googleapis.com/"
```

### 3. Initialize Terraform

``terraform init``

### 4. Validate Configuration

``terraform validate``

### 5. Apply the Configuration

``terraform apply``

Confirm the plan and wait for the resources to be created.

## Outputs

- Workload Identity Pool ID

- Service Account Name

- IAM Binding Status

### Clean-Up

To delete all resources created by this configuration, run:<br>
``terraform destroy``

