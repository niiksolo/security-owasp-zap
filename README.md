# 🔒 OWASP ZAP Security Scan

This project demonstrates an automated security scan of a web application using **OWASP ZAP** and **GitHub Actions**.

## What we use

- **OWASP ZAP** — for baseline security scanning of web apps.
- **Docker** — to run the target application (Juice Shop) and ZAP scanner.
- **GitHub Actions** — to automate the scan on every push or pull request.
- **Artifact Upload** — the HTML report is saved as a downloadable artifact.

## How it works

1. The workflow runs on every push to `main` branch or on pull requests.
2. It starts the Juice Shop Docker container.
3. It runs the OWASP ZAP baseline scan against the application.
4. A report (`zap_report.html`) is generated and uploaded as an artifact.

## Download Report

After the workflow finishes, you can download the security scan report here:  
[Download ZAP Report](https://github.com/niiksolo/security-owasp-zap/actions/runs/18817546104/artifacts/4374373419)
