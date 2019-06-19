data "azurerm_subscription" "current" {}


resource "azurerm_policy_definition" "AddDefaultOOHShutdownTag" {
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

resource "azurerm_policy_assignment" "DefaultShutdownTag" {
  name                 = "DefaultShutdownTag-policy-assignment"
  scope                = "${data.azurerm_subscription.current.id}"
  policy_definition_id = "${azurerm_policy_definition.AddDefaultOOHShutdownTag[0].id}"
  description          = "DefaultShutdownTag"
  display_name         = "DefaultShutdownTag Policy Assignment"
}


resource "azurerm_policy_definition" "EnforceOOHsShutdownTagValue" {
  count        = "${var.create_resource ? 1 : 0 }"
  name         = "EnforceShutdownTag"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "EnforceShutdownTag policy definition"
  policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [{
                 "field": "tags['outofhours']",
                 "exists": "true"
            },
            {"field": "tags['outofhours']",
             "notIn": "[parameters('allowedOOHTags')]"
            }
            ]
        },
        "then": {
            "effect": "deny"
        }
    }
    POLICY_RULE
  parameters = <<PARAMETERS
    {
    "allowedOOHTags": {
      "type": "Array",
        "metadata": {
            "description": "The list of allowed values for for outofhours tag.",
            "displayName": "Allowed OutofHours Tag values"
        },
        "allowedValues": [
            "shutdown",
            "scaledown",
            "delete",
            "donothing"
        ]
        }
    }
    PARAMETERS
  }

resource "azurerm_policy_assignment" "EnforceShutdownTag" {
  name                 = "EnforceShutdownTag-policy-assignment"
  scope                = "${data.azurerm_subscription.current.id}"
  policy_definition_id = "${azurerm_policy_definition.EnforceShutdownTag[0].id}"
  description          = "EnforceShutdownTag"
  display_name         = "EnforceShutdownTag Policy Assignment"
}
