
variable "project_id" {
  type = string
  description = "id for gcp project"
  default = "silent-base-443011-h7"
}

variable "pool_id_suffix" {
  type = string
  description = "mention your identity pool suffix"
  default = "mypool"
}

variable "sa_id_suffix" {
  type = string
  description = "mention your service account suffix"
  default = "mysa"
}


variable "display_name_pool" {
  type = string
  description = "display name for pool"
  default = "test pool"
}

variable "description_for_pool" {
  type = string
  description = "description for pool"
  default = "This pool is created for WIDF authentication"
}

variable "pool_status" {
  type = bool
  description = "true or false to enable/disable pool"
  default = true
}

variable "provider_id" {
  type = string
  description = "id for workload identity provider"
  default = "provider-id-here"
}

variable "provider_status" {
  type = bool
  description = "true or false to enable/disable provider"
  default = true
}

variable "display_name_provider" {
  type = string
  description = "display name for provider"
  default = "display-name-provider"
}

variable "attribute_condition" {
  type = string
  description = "attribute condition CEL expression to allow access"
  default = "assertion.namespace_id=='97296242'"
}

variable "description_for_provider" {
  type = string
  description = "description for provider"
  default = "Provider added in identity pool"
}

variable "attribute_mapping" {
  type = map(string)
  default = {
    "google.subject" = "assertion.sub"
  }
  description = "Attribute mapping for the workload identity provider"
}

variable "oidc_issuer_uri" {
  type        = string
  default     = "https://gitlab.com"
  description = "OIDC issuer URI for the workload identity provider"
}



variable "display_name_sa" {
  type = string
  description = "display name for service account"
  default = "my-sa"
}

variable "wid_role" {
  type = string
  description = " WID user role for service account"
  default = "roles/iam.workloadIdentityUser"
}

variable "member" {
  type = string
  description = "dentities that will be granted the privilege in role"
  default = "principalSet://iam.googleapis.com/"
}


variable "member_sa" {
  type = string
  description = "dentities that will be granted the privilege in role"
  default = "serviceAccount:"
}

variable "impersonated-sa" {
  type = string
  description = "service account that terraform will use to create identity pool"
  default = ""
}


