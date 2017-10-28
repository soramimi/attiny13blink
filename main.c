
#include <avr/io.h>

void waitloop(unsigned int n);

void msleep(int ms)
{
	int n = ms * 31;
	waitloop(n);
	waitloop(n);
	waitloop(n);
	waitloop(n);
	waitloop(n);
}

int main()
{

	DDRB = 0x08;

	while (1) {
		PORTB = 0x08;
		msleep(500);
		PORTB = 0x00;
		msleep(500);
	}
	return 0;
}

