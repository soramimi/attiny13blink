
NAME = blink

CC = avr-gcc
AS = avr-as
CFLAGS = -Os -mmcu=attiny13

all: $(NAME).hex

main.o: main.c

waitloop.o: waitloop.S

$(NAME).elf: main.o waitloop.o
	$(CC) $(CFLAGS) $^ -o $@

$(NAME).hex: $(NAME).elf
	avr-objcopy -O ihex $< $@

clean:
	-rm *.o
	-rm *.elf
	-rm *.hex

