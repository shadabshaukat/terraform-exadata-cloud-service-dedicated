resource oci_database_cloud_vm_cluster export_EE-MEL-PRD-EXACS-DB {
  backup_network_nsg_ids = [
  ]
  backup_subnet_id                = var.backup_subnet_ocid
  cloud_exadata_infrastructure_id = var.oci_database_cloud_exadata_infrastructure_ocid
  cluster_name                    = var.exadb_cluster_name
  compartment_id                  = var.compartment_ocid
  cpu_core_count                  = var.cpu_core_count_combined
 
  data_collection_options {
    is_diagnostics_events_enabled = "true"
    is_health_monitoring_enabled  = "true"
    is_incident_logs_enabled      = "true"
  }
  data_storage_percentage     = var.cluster_data_storage_percentage
  data_storage_size_in_tbs    = var.cluster_data_storage_size_in_tbs
  db_node_storage_size_in_gbs = var.db_node_storage_size_in_gbs_combined
  # db_servers OCID can be fetched after provisioning the 'Exadata Infrastructure' and then 'DB Servers'
  db_servers = [
    var.db_server_1,
    var.db_server_2,
  ]
  display_name = var.exadb_cluster_display_name
  gi_version                  = var.cluster_gi_version
  hostname                    = var.cluster_hostname
  is_local_backup_enabled     = "false"
  is_sparse_diskgroup_enabled = "false"
  license_model               = var.cluster_license_model
  memory_size_in_gbs          = var.memory_size_in_gbs_combined
  nsg_ids = [
  ]
  ocpu_count = var.cluster_ocpu_count
  scan_listener_port_tcp     = var.cluster_scan_listener_port_tcp
  scan_listener_port_tcp_ssl = var.cluster_scan_listener_port_tcp_ssl
  ssh_public_keys = [
    var.cluster_ssh_public_keys,
  ]
  subnet_id      = var.client_subnet_id
  time_zone      = var.cluster_time_zone
}