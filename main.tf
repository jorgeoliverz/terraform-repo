#crear repo

resource "github_repository" "example" {
  name        = "reto1"
  description = "Mi primer reto de Terraform!"
  visibility = "public"
}

#crear branch development

resource "github_branch_protection" "example" {
  repository_id = "reto1"
  pattern = "main"
  enforce_admins = true
  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
  required_status_checks {
    strict   = true
  }
}

#añadir un colaborador

resource "github_repository_collaborator" "a_repo_collaborator" {
  repository = "reto1"
  username   = "AlejCervera"
  permission = "push"
}