output "instance_name" {
  value = google_compute_instance.compute.self_link
}

output "disk_name" {
  value = google_compute_disk.compute.self_link
}
