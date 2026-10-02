# DevOps Learning Hub

A practical, responsive learning hub for beginners covering Linux, AWS concepts, Docker, Terraform, roadmap planning, interview preparation and local browser-based progress tracking.

## Requirements

- Docker Desktop with Docker Compose v2
- Ports 8080 available on your computer

No AWS account or AWS resources are needed to run this project. The AWS module is learning content only.

## Start locally

From this folder, run:

```sh
docker compose up --build
```

Open <http://localhost:8080>. The first build downloads the PHP 8.3 Apache and MySQL 8.4 images. Apache waits until MySQL reports healthy. MySQL data persists in the `mysql_data` named volume.

Stop the app with `Ctrl+C`, then optionally run `docker compose down`. To remove the local database volume as well, run `docker compose down -v` (this deletes local learning data).

## Local configuration

Compose includes development-only fallback credentials so a beginner can start immediately. For local customization, copy `.env.example` to `.env` and change the values. Never use these development defaults for a public or production deployment. The database service has no published host port; only the PHP site is exposed on port 8080.

## Features

- Responsive dark interface with shared navigation and footer
- Beginner roadmap and dedicated Linux, AWS, Docker and Terraform modules
- Practical examples, task checklists and expandable interview answers
- Browser-based progress tracking stored in local storage
- MySQL schema and starter learning-task records for future database-backed features

Progress checkboxes currently remain in the browser that records them. `config/database.php` provides a PDO MySQL connection using environment variables; user progress does not require or send data to the database.

## Project structure

```text
devops-learning-hub/
├── public/
│   ├── index.php
│   ├── about.php
│   ├── roadmap.php
│   ├── linux.php
│   ├── aws.php
│   ├── docker.php
│   ├── terraform.php
│   ├── interview.php
│   ├── progress.php
│   ├── css/style.css
│   └── js/script.js
├── database/init.sql
├── docker/apache.conf
├── config/database.php
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
└── README.md
```
