
variable client_id {
    default =  "QC3AgHk6qdbmC7Yyr82ApBwaaJLwRrNO"
}

variable portal_user_name {
    default = ""                                 # user email
}

variable auth0_domain {
    default = "netapp-cloud-account.auth0.com"   # defailt auth0 domain
}

variable ansible_provision_file {
   default = "./occm_setup.yaml"
}

variable refresh_token {
    default = ""
}
