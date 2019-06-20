resource "azurerm_policy_definition" "AddDefaultDeletionTag" {
  count        = "${var.create_resource && var.add_deletion_tags ? 1 : 0 }"
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
                    "value": "${var.tags_deletion_enable_default_life ? "[addDays(utcNow(), ${var.tags_deletion_default_life_in_days})]": "do-not-delete" }"
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