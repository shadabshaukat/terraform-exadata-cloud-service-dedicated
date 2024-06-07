resource oci_database_database export_DB-Home-11g_database_1 {
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
  db_home_id = var.db_home_ocid
  source = "NONE" 
  lifecycle {
    ignore_changes = [database[0].admin_password, source]
  }
}

resource oci_database_database export_DB-Home-11g_database_2 {
  database {
    admin_password = var.admin_password_11g
    character_set = "AL32UTF8"
    db_backup_config {
      auto_backup_enabled = "false"
    }
    db_name        = "CNXTST"
    db_workload    = "OLTP"
    ncharacter_set = "AL16UTF16"
  }
  db_home_id = var.db_home_ocid
  source = "NONE" 
  lifecycle {
    ignore_changes = [database[0].admin_password, source]
  }
}

resource oci_database_database export_DB-Home-11g_database_3 {
  database {
    admin_password = var.admin_password_11g
    character_set = "AL32UTF8"
    db_backup_config {
      auto_backup_enabled = "false"
    }
    db_name        = "GISTST"
    db_workload    = "OLTP"
    ncharacter_set = "AL16UTF16"
  }
  db_home_id = var.db_home_ocid
  source = "NONE" 
  lifecycle {
    ignore_changes = [database[0].admin_password, source]
  }
}

resource oci_database_database export_DB-Home-11g_database_4 {
  database {
    admin_password = var.admin_password_11g
    character_set = "AL32UTF8"
    db_backup_config {
      auto_backup_enabled = "false"
    }
    db_name        = "MOBUAT"
    db_workload    = "OLTP"
    ncharacter_set = "AL16UTF16"
  }
  db_home_id = var.db_home_ocid
  source = "NONE" 
  lifecycle {
    ignore_changes = [database[0].admin_password, source]
  }
}

resource oci_database_database export_DB-Home-11g_database_5 {
  database {
    admin_password = var.admin_password_11g
    character_set = "AL32UTF8"
    db_backup_config {
      auto_backup_enabled = "false"
    }
    db_name        = "COGE6TST"
    db_workload    = "OLTP"
    ncharacter_set = "AL16UTF16"
  }
  db_home_id = var.db_home_ocid
  source = "NONE" 
  lifecycle {
    ignore_changes = [database[0].admin_password, source]
  }
}
