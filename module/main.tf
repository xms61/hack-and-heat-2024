resource "google_service_account" "compute" {
  account_id   = "hack-and-heat-compute"
  display_name = "Custom SA for VM Instance"
}

resource "google_service_account_iam_member" "compute" {
  service_account_id = google_service_account.compute.id
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:hacknheat@senacor-hack-and-heat-2024.iam.gserviceaccount.com"
}

# TODO: Create a Compute Disk
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk

resource "google_compute_disk" "compute" {
  name  = var.disk_name
  type  = "pd-ssd"
  zone  = "europe-west4-a"
  image = "debian-11-bullseye-v20220719"
}

# TODO: Create a VM with the disk attached
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
resource "google_compute_instance" "compute" {
  name         = var.compute_name
  machine_type = "e2-micro"
  zone         = "europe-west4-a"
  boot_disk {
    source = google_compute_disk.compute.self_link
  }
  network_interface {
    network = "default"
  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.compute.email
    scopes = ["cloud-platform"]
  }
}