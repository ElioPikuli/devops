# 05 – Jenkins CI pipeline

Lecture 6. Build a Jenkins job that:

1. prints a welcome message
2. installs Python and verifies it with `python --version`
3. checks out the repository from the `main` branch
4. runs the unit tests
5. emails the result of every run

## Setup

Jenkins ran as a Docker container, both locally and on Play with Docker:

```bash
docker run -p 8080:8080 -u root -p 50000:50000 -d --name jenkins \
  -v jenkins_home:/var/jenkins_home jenkins/jenkins:latest

# allow git to work on the mounted workspace
docker exec -u root jenkins git config --global --add safe.directory '*'
```

- **Source:** Git SCM, pointed at the team repo [Adir111/DevOpsCourse-Braude](https://github.com/Adir111/DevOpsCourse-Braude), branch `main`.
- **Build step:** the shell script in [`jenkins-build.sh`](jenkins-build.sh).
- **Notifications:** Jenkins email notification over Gmail SMTP (SSL, port 465, SMTP authentication), sending a mail on every build result.

## The code under test

```
app/app.py          add(a, b)
tests/test_app.py   unittest checking add(2, 3) == 5
```

```bash
python -m unittest discover tests
```

We tested the notifications on purpose: a build failed, the failure email arrived, then the fix brought the job back to green and sent a second email.
