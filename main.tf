resource "google_endpoints_service_consumers_iam_binding" "endpoints_service_consumers_iam_bindings" {
  for_each = var.endpoints_service_consumers_iam_bindings

  consumer_project = each.value.consumer_project
  members          = each.value.members
  role             = each.value.role
  service_name     = each.value.service_name

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

