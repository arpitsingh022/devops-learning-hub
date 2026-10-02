CREATE DATABASE IF NOT EXISTS devops_learning CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE devops_learning;

CREATE TABLE IF NOT EXISTS learning_tasks (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  track VARCHAR(40) NOT NULL,
  title VARCHAR(160) NOT NULL,
  description TEXT NOT NULL,
  command_example TEXT NULL,
  sort_order SMALLINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_track_order (track, sort_order)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS learning_progress (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  learner_key CHAR(64) NOT NULL,
  task_id BIGINT UNSIGNED NOT NULL,
  completed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_learner_task (learner_key, task_id),
  CONSTRAINT fk_progress_task FOREIGN KEY (task_id) REFERENCES learning_tasks(id) ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT IGNORE INTO learning_tasks (track,title,description,command_example,sort_order) VALUES
('linux','Navigate the filesystem','Print your location, list files and move into a directory.','pwd && ls -la && cd ~/projects',1),
('linux','Create a project folder','Create a directory tree and an empty file.','mkdir -p demo/logs && touch demo/README.md',2),
('docker','Run a test container','Run the hello-world image and remove its container afterward.','docker run --rm hello-world',1),
('docker','Build an image','Build a local image from the current Dockerfile.','docker build -t hello-app:dev .',2),
('terraform','Initialize Terraform','Initialize the providers in a Terraform working directory.','terraform init',1),
('terraform','Preview a plan','Inspect proposed infrastructure changes before applying them.','terraform plan',2),
('aws','Learn EC2 concepts','Explore instance images, types, networks and security groups.','AMI → instance type → security group',1),
('aws','Learn least privilege','Grant only required actions on required resources.','principal → action → resource → condition',2);
