data "ibm_resource_group" "group" {
  name = "DXLab"
}

resource "ibm_resource_instance" "testacc_ds_resource_instance" {
  name              = "terraform-analytics-engine"
  location          = "eu-de"
  resource_group_id = "${data.ibm_resource_group.group.id}"
  service           = "ibmanalyticsengine"
#  plan              = "standard-hourly"
  plan              = "lite"

  parameters = {
    "num_compute_nodes" = 1
    "hardware_config"   = "default"
    "software_package"  = "ae-1.2-hadoop-spark"
    "advanced_options"  = {
      "ambari_config"     = {
        "core-site"         = {
          "fs.cos.<servicename>.v2.signer.type" = false,
          "fs.cos.<servicename>.endpoint"       = "http://s3.eu.cloud-object-storage.appdomain.cloud",
          "fs.cos.<servicename>.access.key"    = "<accessKey>"
          "fs.cos.<servicename>.secret.key"    = "<secretKey>"
        }
      }
    }
  }
}