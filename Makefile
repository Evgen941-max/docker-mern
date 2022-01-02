mongo:
	docker run -p 27017:27017 \
		-d \
		--rm \
		--name mongodb \
		--network host \
		--env-file ./config/development.env \
		-v mongo-data:/data/db \
		mongo
	

backend_end:
	docker run -p 5000:5000 \
		--rm \
		--name notes-backend \
		-v /home/yevhenii/docker-mern/server:/app \
		-v /app/node_modules \
		--network host \
		notes-backend

backend_dev:
	docker run -d -p 5000:5000 --rm --name notes-backend -v /home/yevhenii/docker-mern/server:/app -v /app/node-modules --net=host --env-file ./config/development.env notes-backend

frontend_dev:
	docker run -d -p 3000:3000 --rm -v /home/yevhenii/docker-mern/client/src:/app/src --name notes-frontend notes-frontend

frontend:
	docker run -p 3000:3000 \
		-d \
		--rm \
		--name notes-frontend \
		--network host \
		notes-frontend
