build:
	-cd ./srcs && docker-compose up --build

stop:
	-cd ./srcs && docker-compose stop

down:
	-cd ./srcs && docker-compose down

clean: down
	-docker volume rm srcs_db_data srcs_wp_data srcs_web_data
	-sudo rm -rf /home/med-doba/data/wp_data/*
	-sudo rm -rf /home/med-doba/data/db_data/*
	-sudo rm -rf /home/med-doba/data/web_data/*
	-sudo rm -rf /home/med-doba/data/wp_data/.*
	-sudo rm -rf /home/med-doba/data/db_data/.*
	-sudo rm -rf /home/med-doba/data/web_data/.*

fclean: clean
	-docker rmi $(shell docker images -q)

re : clean build
