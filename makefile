-include .env

IMAGE_NAME := personal-portfolio-site
CONTAINER_NAME := portfolio-container
GITHUB_USERNAME := mgm103

dockerCreate:; dockerBuild dockerRun

dockerBuild:
	docker build --build-arg GH_TOKEN=$(GITHUB_PAT) -t $(IMAGE_NAME) .

dockerRun:
	docker run -d --name $(CONTAINER_NAME) -p 3000:3000 $(IMAGE_NAME)

dockerStop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

dockerPublish:
	docker push ghcr.io/$(GITHUB_USERNAME)/personal-portfolio:latest

stackDeploy:
	docker stack deploy -c ./docker-stack.yml personal-site --with-registry-auth