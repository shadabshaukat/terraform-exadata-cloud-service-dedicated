resource oci_database_database_software_image export_DBImage-11204-2031017 {
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


resource oci_database_pluggable_database export_pluggable_database {
  container_database_id = oci_database_database.export_DB-Home-19c_database.id
  pdb_name = "PDB2"
  pdb_admin_password = var.pdb_admin_password_19c
  tde_wallet_password = var.pluggable_database_tde_wallet_password
}

resource oci_database_db_home export_DB-Home-19c {
  db_version = "19.23.0.0"
  display_name = "DB-Home-19c"
  is_unified_auditing_enabled = "false"
  source = "VM_CLUSTER_NEW"
  vm_cluster_id = var.vm_cluster_ocid
}

resource oci_database_db_home export_DB-Home-11g {
  database_software_image_id = oci_database_database_software_image.export_DBImage-11204-2031017.id
  db_version = "11.2.0.4.231017"
  display_name = "DB-Home-11g"
  is_unified_auditing_enabled = "false"
  source = "VM_CLUSTER_NEW"
  vm_cluster_id = var.vm_cluster_ocid
}

resource oci_database_database export_DB-Home-19c_database {
  database {
    admin_password = var.admin_password_19c
    character_set = "AL32UTF8"
    db_backup_config {
      auto_backup_enabled = "false"
    }
    db_name        = "DEMO19C"
    db_workload    = "OLTP"
    ncharacter_set = "AL16UTF16"
    sid_prefix = "DEMO19C"
  }
  db_home_id = oci_database_db_home.export_DB-Home-19c.id
  source = "NONE" 
  lifecycle {
    ignore_changes = [database[0].admin_password, source]
  }
}

resource oci_database_database export_DB-Home-11g_database {
  database {
    admin_password = var.admin_password_11g
    character_set = "AL32UTF8"
    db_backup_config {
      auto_backup_enabled = "false"
    }
    db_name        = "CAMDEV"
    db_workload    = "OLTP"
    ncharacter_set = "AL16UTF16"
  }
  db_home_id = oci_database_db_home.export_DB-Home-11g.id
  source = "NONE" 
  lifecycle {
    ignore_changes = [database[0].admin_password, source]
  }
}

