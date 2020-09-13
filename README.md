# Click Count application

Example APP deployed on [Google Cloud Run](https://cloud.google.com/run)

## CI/CD

### Workflow

* All commits on the project will create a new latest image
* When a tag is set, an image is created with the git tag as image's tag, and the staging Cloud RUN service is updated with this image
* When the staging code is ok, code should be merge in the master branch. When a commit comes to master a new image is built with the COMMIT SHA as image's tag and the prod Cloud RUN service is updated with this image
### Infra Requirements

All infra required by the APP is created by terraform. To use it follow instructions on [clickcount-infra](https://github.com/Krast76/clickcount-infra)

### GCP Requirement

A service account should be created and a key should be set in GOOGLE_CREDENTIALS var.

The service account should have these rights :

* Write access to the GCS bucket used as GCR backend
* Allow to Create/Update Cloud Run services

### Gitlab CI

Gitlab-ci is used to handle CI/CD Steps.

Few steps are present :

* Build : Build image based on commit and tags
* Deploy : Deploy built images on Google Cloud Run

Test step was avoid because the project doesn't contains any test. :(

### Variables

Variable | Description
--- | --- 
GOOGLE_CREDENTIALS | Access key to use Google's API
REGISTY_URL | Google Container Registry url
IMAGE_NAME | Container image name
PROJECT | Set by [clickcount-infra](https://github.com/Krast76/clickcount-infra)
REGION | Set by [clickcount-infra](https://github.com/Krast76/clickcount-infra)
VPC_CONNECTOR | Set by [clickcount-infra](https://github.com/Krast76/clickcount-infra)
CACHE_PROD_ADDR | Set by [clickcount-infra](https://github.com/Krast76/clickcount-infra) 
CACHE_STAGING_ADDR | Set by [clickcount-infra](https://github.com/Krast76/clickcount-infra)

## Image

### Environment variables

Variable | Description | Default
--- | --- | ---
REDIS_HOST | Redis instance address | redis 

## Local

### Requirements

* Docker
* docker-compose

### Launch
```bash
docker-compose up -d
```
