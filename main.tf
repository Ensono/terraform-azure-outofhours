resource "azurerm_policy_definition" "DefaultShutdownTag" {
  count        = "${var.create_resource ? 1 : 0 }"
  name         = "DefaultShutdownTag"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "DefaultShutdownTag policy definition"

  policy_rule = <<POLICY_RULE
    {
        "if": {
            "field": "tags['outofhours']",
            "exists": "false"
        },
        "then": {
            "effect": "append",
            "details": [
                {
                    "field": "tags['outofhours']",
                    "value": "shutdown"
                }
            ]
        }
    }
    POLICY_RULE
  }

