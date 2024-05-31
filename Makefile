.PHONY: build deploy open run

# Define variables
IMAGE_NAME=my-algernon-app
PROJECT_ID=$(shell gcloud config get-value project)
REGION=us-central1
GCR_IMAGE=gcr.io/$(PROJECT_ID)/$(IMAGE_NAME)

# Docker build
build:
	docker build -t $(IMAGE_NAME) .

# Docker run
run: open
	docker run -p 8080:8080 $(IMAGE_NAME)

# Deploy to Google Cloud Run
deploy:
ifndef PROJECT_ID
	$(error PROJECT_ID is undefined. Please set your Google Cloud project ID with 'gcloud config set project PROJECT_ID')
endif
ifndef REGION
	$(error REGION is undefined. Please set the REGION variable in the Makefile or as an environment variable)
endif
	docker tag $(IMAGE_NAME) $(GCR_IMAGE)
	docker push $(GCR_IMAGE)
	gcloud run deploy $(IMAGE_NAME) \
		--image $(GCR_IMAGE) \
		--platform managed \
		--region $(REGION) \
		--allow-unauthenticated

# Open the browser
open:
	@echo "Opening http://localhost:8080"
	@sleep 3 && python -m webbrowser http://localhost:8080 &
