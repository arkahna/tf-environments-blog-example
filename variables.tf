variable "location" {
  description = "The location/region where the resources will be created."
  default     = "Australia East"
  type        = string
  nullable    = false
}

variable "tags" {
  description = "A object of tags to add to all resources."
  type = object({
    workload   = string
    owner      = string
    deployedBy = optional(string, "Terraform")
  })
  nullable = true
}

variable "naming" {
  description = "A object of lists used to construct the names of resources."
  type = object({
    prefix = list(string)
    suffix = list(string)
  })
  nullable = false
}
variable "acomplicatedlist" {
  type = list(object({
    name = string
  }))
}
