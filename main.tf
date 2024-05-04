#r
 terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.27.0"
    }
  }
}


provider "google" {
  # Configuration options
    credentials = "thisismustafar-1eb734b72a8e.json"
    project = var.project
    region = var.region
}   


# This is the bucket for your state files
resource "google_storage_bucket" "raw" {
  project = var.project
  name = "${var.data-project}-raw"
  force_destroy = false
  uniform_bucket_level_access = true
  location = var.region
  labels = local.labels
}


locals {
    labels = {
        "data-project" = var.data-project
    }
}

variable "project" {
    type= string
    default = "thisismustafar"
    description = "ID Google project"
}

variable "region" {
    type= string
    default = "southamerica-east1"
    description = "Region Google project"
}

variable  "data-project" {
    type = string
    default = "first_ci_cd"
    description = "Name of data pipeline project to use as resource prefix"
}






