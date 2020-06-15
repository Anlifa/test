provider "google" {
    credentials = "${file("clever-basis-278610-8eb529def4d5.json")}"
    project = "clever-basis-278610"
    region = "europe-north1"
    zone = "europe-north1-a"
}

resource "google_compute_instance" "vm_instance" {
    name = "terraform"
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
