resource "azurerm_policy_definition" "AddDefaultDeletionTag" {
  count        = "${var.create_resource ? 1 : 0 }"
  name         = "DefaultDeletionTag"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "DefaultDeletionTag policy definition"

  policy_rule = <<POLICY_RULE
    {
        "if": {
            "field": "tags['deletiondate']",
            "exists": "false"
        },
        "then": {
            "effect": "append",
            "details": [
                {
                    "field": "tags['deletiondate']",
                    "value": "[addDays(utcNow(), 90)]"
                }
            ]
        }
    }
    POLICY_RULE
  }


resource "azurerm_policy_assignment" "DefaultDeletionTag" {
  name                 = "DefaultDeletionTag-policy-assignment"
  scope                = "${data.azurerm_subscription.current.id}"
  policy_definition_id = "${azurerm_policy_definition.AddDefaultDeletionTag[0].id}"
  description          = "DefaultDeletionTag"
  display_name         = "DefaultDeletionTag Policy Assignment"
}