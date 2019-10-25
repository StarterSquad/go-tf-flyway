build:
	docker build -t squadscom/go-tf-flyway:latest .

push:
	docker push squadscom/go-tf-flyway:latest
