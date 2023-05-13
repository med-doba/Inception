build:
	cd ./srcs && docker-compose up --build

stop:
	cd ./srcs && docker-compose down

clean: stop
	docker volume rm srcs_db_data srcs_wp_data
	rm -rf /Users/med-doba/Desktop/volumes/db_data/*
	rm -rf /Users/med-doba/Desktop/volumes/wp_data/*

fclean: clean
	docker rmi $(shell docker images -q)

re : clean build