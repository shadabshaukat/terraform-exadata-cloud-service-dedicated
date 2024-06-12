#######################################################################
## Full Stack Deployment of Exadata Cloud Service (ExaDB-D)          ##
## Author : Shadab Mohammad, Master Principal Cloud Architect@Oracle ##
#######################################################################

## Exadata Infrastructure ##
resource "oci_database_cloud_exadata_infrastructure" "export_EE-MEL-EXACS-INFRA" {
  availability_domain = var.availability_domain
  compartment_id = var.compartment_ocid
  compute_count  = var.compute_node_count_exadata_infra
  customer_contacts {
    email = var.customer_contacts_email
  }
  display_name = var.exadata_infra_display_name
  maintenance_window {
    custom_action_timeout_in_mins = "0"
    days_of_week {
      name = "SATURDAY"
    }
    hours_of_day = [
      "10",
    ]
    is_custom_action_timeout_enabled = "false"
    lead_time_in_weeks = "4"
    months {
      name = "APRIL"
    }
    months {
      name = "JULY"
    }
    months {
      name = "OCTOBER"
    }
    months {
      name = "JANUARY"
    }
    patching_mode = "ROLLING"
    preference    = "CUSTOM_PREFERENCE"
    skip_ru = [
    ]
    weeks_of_month = [
      "2",
    ]
  }
  shape         = var.shape_exadata_infra
  storage_count = var.storage_node_count_exadata_infra
}

# Data source to get DB servers
data "oci_database_db_servers" "db_servers" {
  compartment_id = var.compartment_ocid
  exadata_infrastructure_id = oci_database_cloud_exadata_infrastructure.export_EE-MEL-EXACS-INFRA.id
}

## VM Cluster ##
resource "oci_database_cloud_vm_cluster" "export_EE-MEL-PRD-EXACS-DB" {
  backup_network_nsg_ids = []
  backup_subnet_id                = var.backup_subnet_ocid
  cloud_exadata_infrastructure_id = oci_database_cloud_exadata_infrastructure.export_EE-MEL-EXACS-INFRA.id
  cluster_name                    = var.exadb_cluster_name
  compartment_id                  = var.compartment_ocid
  cpu_core_count                  = var.cpu_core_count_combined
  data_collection_options {
    is_diagnostics_events_enabled = true
    is_health_monitoring_enabled  = true
    is_incident_logs_enabled      = true
  }
  data_storage_percentage     = var.cluster_data_storage_percentage
  data_storage_size_in_tbs    = var.cluster_data_storage_size_in_tbs
  db_node_storage_size_in_gbs = var.db_node_storage_size_in_gbs_combined
  db_servers = [
    data.oci_database_db_servers.db_servers.db_servers[0].id, 
    data.oci_database_db_servers.db_servers.db_servers[1].id
  ]
  display_name = var.exadb_cluster_display_name
  gi_version                  = var.cluster_gi_version
  hostname                    = var.cluster_hostname
  is_local_backup_enabled     = false
  is_sparse_diskgroup_enabled = false
  license_model               = var.cluster_license_model
  memory_size_in_gbs          = var.memory_size_in_gbs_combined
  nsg_ids = []
  ocpu_count = var.cluster_ocpu_count
  scan_listener_port_tcp     = var.cluster_scan_listener_port_tcp
  scan_listener_port_tcp_ssl = var.cluster_scan_listener_port_tcp_ssl
  ssh_public_keys = [var.cluster_ssh_public_keys]
  subnet_id      = var.client_subnet_id
  time_zone      = var.cluster_time_zone
}

## Software Image for 11g (Needs Upgrade Support activated via a SR). Remove the block if 11g is not needed ##
resource "oci_database_database_software_image" "export_DBImage-11204-2031017" {
  compartment_id = var.compartment_ocid
  database_software_image_one_off_patches = [
    "21289564",
    "22291453",
    "22366322",
    "25139545",
    "30432076",
    "31228670",
    "31335037",
    "32224895",
    "32327201",
    "32558369",
    "33613829",
    "33991024",
    "34006614",
    "34533061",
    "34698179",
    "35099667",
    "35220732",
    "35239280",
    "35313335",
    "35574089",
    "35638387",
    "35685663",
  ]
  database_version = "11.2.0.4"
  display_name = "DBImage-11204-2031017"
  image_shape_family = "EXADATA_SHAPE"
  image_type         = "DATABASE_IMAGE"
  patch_set = "11.2.0.4.231017"
}

## Oracle 19c DB Home ##
resource "oci_database_db_home" "export_DB-Home-19c" {
  db_version = "19.23.0.0"
  display_name = "DB-Home-19c"
  is_unified_auditing_enabled = false
  source = "VM_CLUSTER_NEW"
  vm_cluster_id = oci_database_cloud_vm_cluster.export_EE-MEL-PRD-EXACS-DB.id
}

## Oracle 19c Database ##
resource "oci_database_database" "export_DB-Home-19c_database" {
  database {
    admin_password = var.admin_password_19c
    character_set = "AL32UTF8"
    db_backup_config {
      auto_backup_enabled = false
    }
    db_name        = "DEMO19C"
    db_workload    = "OLTP"
    ncharacter_set = "AL16UTF16"
    sid_prefix     = "DEMO19C"
  }
  db_home_id = oci_database_db_home.export_DB-Home-19c.id
  source = "NONE"
  lifecycle {
    ignore_changes = [database[0].admin_password, source]
  }
}

## Oracle 19c Pluggable Database 1 ##
resource "oci_database_pluggable_database" "export_pluggable_database" {
  container_database_id = oci_database_database.export_DB-Home-19c_database.id
  pdb_name = "PDB1"
  pdb_admin_password = var.pdb_admin_password_19c
  tde_wallet_password = var.pluggable_database_tde_wallet_password
}

## Oracle 19c Pluggable Database 2 ##
resource "oci_database_pluggable_database" "export_pluggable_database_1" {
  container_database_id = oci_database_database.export_DB-Home-19c_database.id
  pdb_name = "PDB2"
  pdb_admin_password = var.pdb_admin_password_19c
  tde_wallet_password = var.pluggable_database_tde_wallet_password
}

## Oracle 11gR2 DB Home ##
resource "oci_database_db_home" "export_DB-Home-11g" {
  database_software_image_id = oci_database_database_software_image.export_DBImage-11204-2031017.id
  db_version = "11.2.0.4.231017"
  display_name = "DB-Home-11g"
  is_unified_auditing_enabled = false
  source = "VM_CLUSTER_NEW"
  vm_cluster_id = oci_database_cloud_vm_cluster.export_EE-MEL-PRD-EXACS-DB.id
}

## Oracle 11gR2 Database ##
resource "oci_database_database" "export_DB-Home-11g_database" {
  database {
    admin_password = var.admin_password_11g
    character_set = "AL32UTF8"
    db_backup_config {
      auto_backup_enabled = false
    }
    db_name        = "CAMSDEV"
    db_workload    = "OLTP"
    ncharacter_set = "AL16UTF16"
  }
  db_home_id = oci_database_db_home.export_DB-Home-11g.id
  source = "NONE"
  lifecycle {
    ignore_changes = [database[0].admin_password, source]
  }
}
