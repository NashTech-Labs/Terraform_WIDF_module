output "pool_name" {
  value = google_iam_workload_identity_pool.demo-pool.name
  description = "Name of the workload identity pool."
}

output "service_account_email" {
  value = google_service_account.tf_sa.email
  description = "Email of the created service account."
}

output "provider_name" {
  value = google_iam_workload_identity_pool_provider.demo-provider.name
  description = "Name of the workload identity provider."
}
