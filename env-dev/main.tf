env = "dev"

# component = {
#   frontend = {
#     name      = "frontend"
#     container = true
#   }
#   mongodb = {
#     name      = "mongodb"
#     container = false
#   }
#   catalogue = {
#     name      = "catalogue"
#     container = true
#   }
#   user = {
#     name      = "user"
#     container = true
#   }
#   cart = {
#     name      = "cart"
#     container = true
#   }
#   mysql = {
#     name      = "mysql"
#     container = false
#   }
#   shipping = {
#     name      = "shipping"
#     container = true
#   }
#   payment = {
#     name      = "payment"
#     container = true
#   }
#   rabbitmq = {
#     name      = "rabbitmq"
#     container = false
#   }
#   redis = {
#     name      = "redis"
#     container = false
#   }
# }

databases = {
  mongodb = {
    name      = "mongodb"
    container = false
  }

  mysql = {
    name      = "mysql"
    container = false
  }
  rabbitmq = {
    name      = "rabbitmq"
    container = false
  }
  redis = {
    name      = "redis"
    container = false
  }
}