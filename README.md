# Personal Portfolio

## Description

This project is a showcase of all my work as a software engineer. The site aims to act as a central hub for my projects, skills, CV and GitHub Activity. Essentially, any datapoint that a potential employer/collaborator interested in my services will be able to find this information here.

This site is accessible at: [Personal Portfolio](https://marcusmarinelli.com).

## Getting Started

### Requirements:

The following must be installed on you machine:
- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git/)
- [node](https://nodejs.org/en/download)
- [docker](https://docs.docker.com/engine/install/)

### Quickstart:

```
git clone https://github.com/MGM103/Personal-Portfolio-Site.git
cd Personal-Portfolio-Site
npm run dev
```
## Docker 

This project uses a private image, if you are forking this project, you can replace all your credentials in the `makefile`. Additionally you will need to create a `.env` file with:
- GitHub Personal Access Token
- GitHub Container Registry Access Token

The `makefile` itself contains shortcuts for all the usefull docker commands for local dev with docker. I found this was also helpful as I deployed the container on a vps to deploy the project.

To deploy to the VPS I used docker stack, the yaml file for this deployment is `docker-stack.yml`. 

## Acknowledgements

The following two videos were instrumental in setting up my VPS to be production grade and to create the CI/CD pipeline for automated deployments using docker stack.

- [Production grade VPS](https://www.youtube.com/watch?v=F-9KWQByeU0&t=1550s)
- [Automated Deployments with Docker stack](https://www.youtube.com/watch?v=fuZoxuBiL9o&t=885s)

