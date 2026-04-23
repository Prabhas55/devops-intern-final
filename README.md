# DevOps Intern Final Assessment

![CI](https://github.com/Prabhas55/devops-intern-final/actions/workflows/ci.yml/badge.svg?branch=main)

**Name:** Prabhas Nalajala
**Date:** 2026-04-23
**Description:** A complete DevOps pipeline using Linux, Docker, GitHub Actions, Nomad, and Grafana Loki.

---

## Project Structure
devops-intern-final/
├── README.md
├── hello.py
├── Dockerfile
├── scripts/
│   └── sysinfo.sh
├── .github/
│   └── workflows/
│       └── ci.yml
├── nomad/
│   └── hello.nomad
└── monitoring/
└── loki_setup.txt

---

## Step 1: Git & GitHub
Repository initialized with README and sample script.

git clone https://github.com/Prabhas55/devops-intern-final.git
cd devops-intern-final
python3 hello.py


---

## Step 2: Linux Scripting

chmod +x scripts/sysinfo.sh
./scripts/sysinfo.sh


---

## Step 3: Docker
Build and run the container:

docker build -t devops .
docker run devops


---

## Step 4: CI/CD with GitHub Actions
Pipeline runs automatically on every push to main branch.
Check status in the Actions tab or via the badge above.

---

## Step 5: Nomad Deployment

# Start Nomad
sudo nomad agent -dev

# Run the job
nomad job run nomad/hello.nomad

# Check status
nomad job status hello


---

## Step 6: Monitoring with Grafana Loki
# Start Loki
docker run -d --name loki -p 3100:3100 grafana/loki:latest

# Verify
curl http://localhost:3100/ready

# Send logs
TS=$(date +%s)000000000 && curl -X POST http://localhost:3100/loki/api/v1/push -H "Content-Type: application/json" -d "{\"streams\":[{\"stream\":{\"job\":\"hello\"},\"values\":[[\"$TS\",\"Hello from Nomad\"]]}]}"

# View logs
curl -G http://localhost:3100/loki/api/v1/query_range --data-urlencode 'query={job="hello"}' --data-urlencode 'start=2026-04-23T00:00:00Z' --data-urlencode 'end=2026-04-24T00:00:00Z'

