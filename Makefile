NAME	= inception

all	: $(NAME)

$(NAME)	:
	@echo "~ CREATING NETWORK ~"
	sudo mkdir -p ${HOME}/data/wordpress ${HOME}/data/mariadb
	cd ./srcs && docker-compose up --build -d

clean	:
	@echo "~ CLEANING ~"
	sudo docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans

fclean	: clean
	sudo rm -rf ${HOME}/data
	sudo docker system prune --volumes --all --force
	sudo docker network prune --force
	sudo docker volume prune --force

re	: fclean all

.PHONY	: all clean fclean re

