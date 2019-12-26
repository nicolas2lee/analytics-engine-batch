data "ibm_resource_group" "group" {
  name = "DXLab"
}

resource "ibm_resource_instance" "testacc_ds_resource_instance" {
  name              = "analytics-engine"
  location          = "eu-de"
  resource_group_id = "${data.ibm_resource_group.group.id}"
  service           = "ibmanalyticsengine"
  plan              = "lite"

  parameters = {
    "num_compute_nodes" = 1
    "hardware_config" = "default"
    "software_package" = "ae-1.2-hadoop-spark"
  }
}