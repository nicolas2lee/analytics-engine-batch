data "ibm_resource_group" "group" {
  name = "DXLab"
}

resource "ibm_resource_instance" "testacc_ds_resource_instance" {
  name              = "analytics-engine"
  location          = "global"
  resource_group_id = "${data.ibm_resource_group.group.id}"
  service           = "ibmanalyticsengine"
}