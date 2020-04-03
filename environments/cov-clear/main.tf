module "users" {
  source = "../../modules/users"

  developers = [
    "jose.galarza",
    "kostas.stamatoukos"
  ]
}

module "emails" {
  source = "../../modules/emails"

  domain = "cov-clear.com"
}

module "production_backend" {
  source = "../../modules/backend"

  app_name = "production-backend"
}
