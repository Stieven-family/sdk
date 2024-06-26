# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: josfelip <josfelip@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/20 12:34:41 by josfelip          #+#    #+#              #
#    Updated: 2024/06/26 09:59:15 by josfelip         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = new_project

INCLUDE_DIR = ./include/
INCLUDE_PATH = $(wildcard $(INCLUDE_DIR)*.h)
INCLUDE = $(notdir $(INCLUDE_PATH))

SRC_DIR = ./src/
SRC_PATH = $(wildcard $(SRC_DIR)*.c)
SRC = $(notdir $(SRC_PATH))

OBJ_DIR = ./obj/
OBJ_PATH = $(addprefix $(OBJ_DIR), $(SRC:%.c=%.o))

LIBFT_DIR = ./lib/libft/
LIBFT = libft.a
LIBFT_PATH = $(addprefix $(LIBFT_DIR), $(LIBFT))

CFLAGS = -Wall -Wextra -Werror
RM = rm -rf

all: libft ${OBJ_DIR} ${NAME}

libft:
	@make -C ${LIBFT_DIR} --no-print-directory

${OBJ_DIR}:
	mkdir -p ${OBJ_DIR}

${OBJ_DIR}%.o: ${SRC_DIR}%.c ${INCLUDE_PATH}
	${CC} ${CFLAGS} -I${INCLUDE_DIR} -c $< -o $@

${NAME}: ${OBJ_PATH}
	${CC} ${CFLAGS} -o ${NAME} ${OBJ_PATH} -L $(LIBFT_DIR) -lft

clean:
	${RM} ${OBJ_DIR}

fclean: clean
	${RM} ${NAME}
	@make fclean -C ${LIBFT_DIR} --no-print-directory

re: fclean all

.PHONY: all clean fclean re


