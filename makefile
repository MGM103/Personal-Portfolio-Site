-include .env

IMAGE_NAME := personal-portfolio-site
CONTAINER_NAME := portfolio-container

dockerCreate:; dockerBuild dockerRun

dockerBuild:
	docker build --build-arg GH_TOKEN=$(GITHUB_PAT) -t $(IMAGE_NAME) .

dockerRun:
	docker run -d --name $(CONTAINER_NAME) -p 3000:3000 $(IMAGE_NAME)

dockerStop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)