mongo:
	docker run -p 27017:27017 \
		-d \
		--rm \
		--name mongodb \
		--network host \
		--env-file ./config/development.env \
		-v mongo-data:/data/db \
		mongo
	

backend:
	docker run -p 5000:5000 \
		--rm \
		--name notes-backend \
		--network host \
		notes-backend

frontend:
	docker run -p 3000:3000 \
		-d \
		--rm \
		--name notes-frontend \
		--network host \
		notes-frontend
