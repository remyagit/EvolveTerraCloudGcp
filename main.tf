resource "google_compute_instance" "firstvm" {
  name                      = "firstvm"
  machine_type              = "n1-standard-1"
  hostname                  = "firstvm.com"
  zone                      = "us-central1-a"
  allow_stopping_for_update = true

  #tags = "[firstvmtag_in_VPC]"

  labels = {
    name  = "firstvm"
    owner = "remya"
    user  = "remya"
    dept  = "it"
    os    = "centos7"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }



  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }



  metadata_startup_script = "echo 'hi there' > /test.txt"

  //service_account {
   // email = "terrafromtraining@evolve-3-workstream.iam.gserviceaccount.com"
    //  scopes = ["userinfo-email", "compute-ro", "storage-ro"]
   // scopes = ["https://www.googleapis.com/auth/cloud-platform"]
 // }
}
