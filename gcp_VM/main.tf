resource "google_compute_instance" "gcp-vm" {
  machine_type = var.compute
  name = var.vmname
  boot_disk {
    source = var.gcpimage
  }
  network_interface {
    network = var.gcpnet
    subnetwork = var.gcpsub
  }
}