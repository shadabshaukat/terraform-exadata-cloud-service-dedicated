## Global Variables ##
variable compartment_ocid { default = "ocid1.compartment.oc1..aaaaaaaanmispunf3q3ra3jucapmr5uke24ww3vkpezc6g5lwxe73fgs57ya" }
variable availability_domain { default = "ZVCk:AP-MUMBAI-1-AD-1" }
variable region { default = "ap-mumbai-1" }
## Exadata Infrastructure Variables ##
variable customer_contacts_email { default = "example.sysadmin@acme.com" }
variable exadata_infra_display_name { default = "COE-BOM-EXACS-INFRA" }
variable shape_exadata_infra { default = "Exadata.X8M" }
variable compute_node_count_exadata_infra { default = "2" }
variable storage_node_count_exadata_infra { default = "3" }
## VM Cluster Variables ##
variable backup_subnet_ocid { default = "ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaapja6gtyf5rxz6wbtwhjnpqmvu4cusmmleo5jlb2tp64nknt5igpa" }
variable client_subnet_id { default = "ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaaphzukdrgj7ie57nrxig7oeqd4omqdjvgt7amh6fipcbsdlg6rsca" }
variable exadb_cluster_name { default = "exacluster" }
variable cpu_core_count_combined { default = "4" }
variable cluster_data_storage_percentage { default = "80" }
variable cluster_data_storage_size_in_tbs { default = "4" }
variable db_node_storage_size_in_gbs_combined { default = "512" }
variable exadb_cluster_display_name { default = "COE-BOM-PRD-EXACS-DB" }
variable cluster_gi_version { default = "19.0.0.0" }
variable cluster_hostname { default = "exavmnode" }
variable memory_size_in_gbs_combined { default = "512" }
variable cluster_ocpu_count { default = "4" }
variable cluster_scan_listener_port_tcp { default = "1521" }
variable cluster_scan_listener_port_tcp_ssl { default = "2484" }
variable cluster_ssh_public_keys { default = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAs4f9ua0AU3U08s3s7D75Z7gUkmV0WgAYL7bdolT4r/N98uGXgaa6t4AYN+wKN0gdnjbEWunmoPf0ico8Trqlto8Vdp52DlvOjMZ/26KdJu8b0ytzV/MDO8RZhmL7A/Cwcr9VcPoRoGpfY/PExMGZUXBT7XOQ+ModkkhjCCyLebnMhE7Dv8HjqGnQI9jxob/DhZ0M8Xz9j9OUK82cTUCwtRULYXRx2h9vL5wHp7HZIddNjdnssXADVBVbzerO4S7aRaKfdIEaZu8JL4JYoDrtxv/sWRB3IdSTgYco6augNcTTdkDefn+Qr2dLZFSvcqSY8lP6Tz+/Yp3SLCeWKys+xQ== shadab" }
variable cluster_time_zone { default = "India/Mumbai" }
variable cluster_license_model { default = "LICENSE_INCLUDED" }
## DB Home 19c and Databases with Pluggable DB Variables ##
variable pdb_admin_password_19c { default = "YOurPassword1234#_" }
variable admin_password_19c { default = "YOurPassword1234#_" }
variable pluggable_database_tde_wallet_password { default = "YOurPassword1234#_" }
