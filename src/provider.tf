terraform {
  required_version = ">=1.0.0"

  backend "gcs" {
    bucket = "harmelodic-terraform-state"
    prefix = "ops"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.74.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

variable "project" {
  description = "GCP Project ID"
  sensitive   = true
  type        = string
}

variable "region" {
  default     = "europe-north1"
  description = "GCP Region"
  sensitive   = false
  type        = string
}