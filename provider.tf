terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}

# Configure the Harness provider for Next Gen resources
# Platform API KEY HARNESS_PLATFORM_API_KEY
provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = "Io9SR1H7TtGBq9LVyJVB2w"
}