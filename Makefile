# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: luzog78 <luzog78@gmail.com>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/19 13:16:00 by ysabik            #+#    #+#              #
#    Updated: 2026/02/14 00:39:59 by luzog78          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BUILD_DIR	= build

CC			= gcc
CFLAGS		= -Wall -Wextra -Werror -g $(addprefix -I, $(INCLUDES))

NASM		= nasm
NASMFLAGS	= -f elf64


all: c asm


help:
	@echo "Available targets:"
	@echo "  all       - Build all components"
	@echo "  c         - Build C implementations"
	@echo "  asm       - Build assembly implementations"
	@echo
	@echo "  clean     - Remove object files"
	@echo "  fclean    - Remove all artifacts"
	@echo "  re        - Rebuild all components"
	@echo
	@echo "  help      - Show this help message"


c: C/Colleen C/Grace C/Sully


asm: ASM/Colleen ASM/Grace ASM/Sully


C/Colleen: $(BUILD_DIR)/C/Colleen.c.o
	$(CC) $(CFLAGS) -o $@ $^


C/Grace: $(BUILD_DIR)/C/Grace.c.o
	$(CC) $(CFLAGS) -o $@ $^


C/Sully: $(BUILD_DIR)/C/Sully.c.o
	$(CC) $(CFLAGS) -o $@ $^


ASM/Colleen: $(BUILD_DIR)/ASM/Colleen.s.o
	$(CC) $(CFLAGS) -o $@ $^


ASM/Grace: $(BUILD_DIR)/ASM/Grace.s.o
	$(CC) $(CFLAGS) -o $@ $^
	

ASM/Sully: $(BUILD_DIR)/ASM/Sully.s.o
	$(CC) $(CFLAGS) -o $@ $^


$(BUILD_DIR)/%.c.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@


$(BUILD_DIR)/%.s.o: %.s
	@mkdir -p $(dir $@)
	$(NASM) $(NASMFLAGS) $< -o $@


clean:
	rm -rf $(BUILD_DIR) \
		Grace_kid.c Grace_kid.s Grace_kid.py \
		Sully_[0-4] Sully_[0-4].c Sully_[0-4].s Sully_[0-4].py \


fclean: clean
	rm -f C/Colleen C/Grace C/Sully ASM/Colleen ASM/Grace ASM/Sully


re: fclean all


.PHONY: c asm all help clean fclean re
