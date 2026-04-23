job "hello" {
  datacenters = ["dc1"]
  type        = "service"

  group "hello-group" {
    count = 1

    task "hello-task" {
      driver = "docker"

      config {
        image      = "prabhas95/devops:v2"
        force_pull = true
      }

      resources {
        cpu    = 100
        memory = 64
      }
    }
  }
}
