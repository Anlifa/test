provider "google" {
    credentials = "${file("${var.credentials}")}"
    project = "${var.project}"
    region = "${var.region}"
    zone = "${var.zone}"
}

resource "google_compute_instance" "vm_instance" {
    name = "terraform-instance"
    machine_type = "n1-standard-1"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }

    network_interface {
    network = "default"
    access_config {
    }
  }
}