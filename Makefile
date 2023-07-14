build:
	-cd ./srcs && docker-compose up --build

stop:
	-cd ./srcs && docker-compose stop

down:
	-cd ./srcs && docker-compose down

clean: down
	-docker volume rm srcs_db_data srcs_wp_data srcs_web_data
	-rm -rf /Users/mac/Desktop/volumes/wp_data/*
	-rm -rf /Users/mac/Desktop/volumes/db_data/*
	-rm -rf /Users/mac/Desktop/volumes/web_data/*
	-rm -rf /Users/mac/Desktop/volumes/wp_data/.*
	-rm -rf /Users/mac/Desktop/volumes/db_data/.*
	-rm -rf /Users/mac/Desktop/volumes/web_data/.*

fclean: clean
	-docker rmi $(shell docker images -q)

re : clean build
