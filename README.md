# DevOps Course – Braude College of Engineering

[![CI](https://github.com/ElioPikuli/devops/actions/workflows/ci.yml/badge.svg)](https://github.com/ElioPikuli/devops/actions/workflows/ci.yml)

Hands-on work from the DevOps course in my B.Sc. in Software Engineering at Braude College of Engineering, done in a two-person team with Adir David.
The work runs from Linux basics through Git workflows, Bash automation, Docker, a Jenkins CI pipeline, and Kubernetes clusters.

## What's inside

| # | Topic | What we built | Tools |
|---|-------|---------------|-------|
| 01 | [Linux basics](01-linux-basics/) | Ubuntu VM setup, file-system navigation, links, man pages | VirtualBox, Ubuntu 24.04, Bash |
| 02 | [Git & GitHub](02-git-github/) | CRUD over Git, protected `main` with 2 required PR approvals, Dependabot | Git, GitHub |
| 03 | [Bash backup script](03-bash-backup-script/) | Timestamped backups with rotation (keeps the newest 3) | Bash |
| 04 | [Docker](04-docker/) | Containerized a Python app; ran containers on Play with Docker and Docker Desktop | Docker |
| 05 | [Jenkins CI](05-jenkins-ci/) | Jenkins in Docker; job that checks out the repo, installs Python, runs unit tests, and emails every result | Jenkins, Docker, Python `unittest`, SMTP |
| 06 | [Kubernetes](06-kubernetes/) | `kubeadm` cluster with 1 control plane + 3 workers; Minikube deployment, dashboard, service tested with Postman | Kubernetes, kubeadm, kubectl, Minikube, Postman |

## CI on this repo

[`.github/workflows/ci.yml`](.github/workflows/ci.yml) runs on every push and pull request:

- the unit tests from the Jenkins exercise (`05-jenkins-ci`)
- ShellCheck plus a functional test of the backup script, including rotation (`03-bash-backup-script`)
- a Docker build and run of the image, with its output checked (`04-docker`)

This workflow was added when the coursework was moved to this repo. It runs the same checks as the Jenkins job, using GitHub Actions.

## Run it locally

```bash
# Unit tests (exercise 05)
cd 05-jenkins-ci && python -m unittest discover tests

# Docker (exercise 04)
docker build -t hello-docker 04-docker && docker run --rm hello-docker

# Backup script (exercise 03); paths can be overridden with env vars
SRC_DIR=~/personal DEST_BASE=~/backups ./03-bash-backup-script/backup.sh
```
