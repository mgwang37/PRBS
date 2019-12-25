#include <stdio.h>
#include <stdint.h>

uint32_t get_bit (uint32_t pp)
{
	uint32_t p_v1;
	uint32_t p_v2;

	if (pp & (0x1<<9))
	{
		p_v1 = 1;
	}
	else
	{
		p_v1 = 0;
	}

	if (pp & (0x1<<6))
	{
		p_v2 = 1;
	}
	else
	{
		p_v2 = 0;
	}
	return (p_v1 ^ p_v2);
}

int main ()
{
	uint32_t p_index = 0;
	uint32_t seed = 0x3ff;
	uint32_t move_time = 10;

	while (1)
	{
		if (get_bit(seed))
		{
			seed <<=1;
			seed += 1;
			move_time++;
		}
		else
		{
			seed <<=1;
			move_time++;
		}
		p_index ++;

		if ((seed & 0x3ff) == 0x3ff)
		{
			break;
		}

		if (move_time == 32)
		{
			printf ("%08X\n", seed);
			move_time =0;
		}
	}

	printf ("====%u=====\n", p_index);
}

