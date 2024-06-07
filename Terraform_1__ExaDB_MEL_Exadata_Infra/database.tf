resource oci_database_cloud_exadata_infrastructure export_EE-MEL-EXACS-INFRA {
  availability_domain = var.availability_domain--PrbP-AP-MELBOURNE-1-AD-1
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

