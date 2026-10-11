variable "endpoints_service_consumers_iam_bindings" {
  description = <<EOT
Map of endpoints_service_consumers_iam_bindings, attributes below
Required:
    - consumer_project
    - members
    - role
    - service_name
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    consumer_project = string
    members          = set(string)
    role             = string
    service_name     = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

