backend_dev:
	docker run -d -p 5000:5000 --rm --name notes-backend -v /home/yevhenii/docker-mern/server:/app -v /app/node-modules --net=host --env-file ./config/development.env notes-backend

frontend_dev:
	docker run -d -p 3000:3000 --rm -v /home/yevhenii/docker-mern/client/src:/app/src --name notes-frontend notes-frontend

mongo_dev:
	docker run -d -p 27017:27017 --rm --name mongodb --net=host --env-file ./config/development.env -v mongo-data:/data/db mongo

stop:
	docker stop mongodb notes-backend notes-frontend

dev:
	docker-compose -f docker-compose.yml up -d

dev_stop:
	docker-compose -f docker-compose.yml down

build:
	docker-compose -f docker-compose.production.yml up

down:
	docker-compose down

#

SSH_STRING:=root@5.101.51.199

ssh:
	ssh ${SSH_STRING}

copy-files:
	scp -r ./* ssh ${SSH_STRING}:/root/app