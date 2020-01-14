#include <stdio.h>

int get_bit (unsigned char *data, int postion, int max)
{
	int p_tmp;

	if (postion > (max*8-1))
	{
		return 0;
	}

	switch (postion%8)
	{
	case 0:
		p_tmp = data[postion/8] & 128;
		break;
	case 1:
		p_tmp = data[postion/8] & 64;
		break;
	case 2:
		p_tmp = data[postion/8] & 32;
		break;
	case 3:
		p_tmp = data[postion/8] & 16;
		break;
	case 4:
		p_tmp = data[postion/8] & 8;
		break;
	case 5:
		p_tmp = data[postion/8] & 4;
		break;
	case 6:
		p_tmp = data[postion/8] & 2;
		break;
	default:
		p_tmp = data[postion/8] & 1;
		break;
	}

	return p_tmp;
}

unsigned int get_crc (unsigned char *data, int size)
{
	int p_index;
	int sum_bits;
	unsigned long long ret_reg = 0;
	unsigned long long ret_crc = 0x104C11DB7ll;

	sum_bits = size * 8 + 32;

	for (p_index = 0; p_index < sum_bits; p_index++)
	{
		ret_reg <<=1;
		if (get_bit (data, p_index, size))
		{
			ret_reg +=1;
		}

		if (ret_reg & (0x1ll<<32))
		{
			ret_reg ^= ret_crc;
		}
	}

	return ret_reg;
}

int main ()
{
	unsigned char pp[512]={255, 255, 255, 255, 255, 255, 255, 255, 255, 255};

	printf ("=========0x%08x\n", get_crc (pp, 10));
}

