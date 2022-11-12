resource "digitalocean_app" "spell-gen" {
  spec {
    name   = "spell-generator"
    region = "nyc"
    domain {
      name = "spell-design.nullsheen.com"
      type = "PRIMARY"
      zone = "nullsheen.com"
    }

    static_site {
      name          = "spell-design-generator-sr3"
      build_command = "npm run build"
      output_dir    = "/build"

      git {
        repo_clone_url = "https://github.com/criticalfault/sr3-spell-generator.git"
        branch         = "main"
      }
    }
  }
}