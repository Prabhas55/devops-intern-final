# DevOps Intern Final Assessment

![CI](https://github.com/Prabhas55/devops-intern-final/actions/workflows/ci.yml/badge.svg?branch=main)

Name: Prabhas Nalajala  

Date: 2026-04-23  

Description: A complete DevOps pipeline using Linux, Docker, GitHub Actions, Nomad, and Loki.

## Docker

Build the image:
```
docker build -t devops .
```

Run the container:
```
docker run devops
```

## Nomad Deployment

Start Nomad in dev mode:
```bash
sudo nomad agent -dev
```

Run the job:
```bash
nomad job run nomad/hello.nomad
```
