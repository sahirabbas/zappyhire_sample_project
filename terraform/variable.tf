
variable "client_id" {
  description = "Client ID of the SPN"
}

variable "client_secret" {
  description = "Client Secret of the SPN"
}

variable "tenant_id" {
  description = "Tenant ID associated with the SPN"
}

variable "subscription_id" {
  description = "ID of the Azure subscription to use"
}

variable "docker_user" {
    description = "Docker User Name"
}
variable "docker_pass" {
    description = "Docker Password"
}
variable "image_tag" {
    description = "Docker Image Tag"
}