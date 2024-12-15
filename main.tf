provider "google" {
  project = var.project_id # Replace with your GCP project ID
  impersonate_service_account = var.impersonated-sa

}

resource "random_string" "pool_id_suffix" {
  length  = 8
  special = false
  upper   = false
  lower   = true
  numeric = false
}

resource "random_string" "serviceAccount_name_suffix" {
  length  = 8
  special = false
  upper   = false
  lower   = true
  numeric = false
}


resource "google_iam_workload_identity_pool" "demo-pool" {
  workload_identity_pool_id = "${var.pool_id_suffix}${random_string.pool_id_suffix.result}"
  display_name              = var.display_name_pool
  description               = var.description_for_pool
  disabled                  = var.pool_status
}

    
resource "google_iam_workload_identity_pool_provider" "demo-provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.demo-pool.workload_identity_pool_id
  workload_identity_pool_provider_id = var.provider_id
  disabled = var.provider_status
  display_name = var.display_name_provider
  attribute_condition = var.attribute_condition

  description = var.description_for_provider

  attribute_mapping                  = var.attribute_mapping
  oidc {
    issuer_uri = var.oidc_issuer_uri
  }
}

#Service Account
resource "google_service_account" "tf_sa" {
  account_id   = "${var.sa_id_suffix}${random_string.serviceAccount_name_suffix.result}"
  display_name = var.display_name_sa
 depends_on = [google_iam_workload_identity_pool.demo-pool]

}

#Binding workloadIdentity User role to Service Account
resource "google_service_account_iam_member" "workload_identity_binding_sa" {
  service_account_id = google_service_account.tf_sa.name
  role               = var.wid_role 

  member = "${var.member_sa}${google_service_account.tf_sa.email}"
  depends_on = [google_service_account.tf_sa]
}

#Binding Workload Identity Pool to Service Account
resource "google_service_account_iam_member" "workload_identity_binding" {
  service_account_id = google_service_account.tf_sa.name
  role               = var.wid_role 

  member = "${var.member}${google_iam_workload_identity_pool.demo-pool.name}/*"
  depends_on = [google_service_account.tf_sa]
}


