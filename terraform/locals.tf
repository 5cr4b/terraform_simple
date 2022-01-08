resource "random_id" "id" {
  byte_length = 8
}

locals {
    id = lower(random_id.id.hex)
    location = "Central US"
    customer = "nbui26"
    env_varibles = {
      DOCKER_REGISTRY_SERVER_USERNAME = ""
      DOCKER_REGISTRY_SERVER_PASSWORD = ""
      DOCKER_REGISTRY_SERVER_URL = ""
    }
}

    
