env     = "p"
region  = "auea"
company = "sa"
proj    = "billing"
# location = "Australia"
kvname                           = "billing"
service_plan_sku                 = "B2"
str_name                         = "azurebilling"
storage_account_replication_type = "LRS"
extra_tags = {
  environment = "prod"
}
vnet_address_space  = ["10.134.1.0/24"]
fn_sn_fa            = ["10.134.1.0/28"]
pe_fa_address_space = ["10.134.1.16/28"]
# str_address_space          = ["10.134.1.32/28"]
# api_version = "api-version=2023-11-01"