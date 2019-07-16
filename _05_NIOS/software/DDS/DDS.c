#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include <stdio.h>
#include <alt_types.h>
#include <io.h>
#include <system.h>
#include <string.h>
//#include <stdlib.h>

//#include "sys/alt_stdio.h"
#include "system.h"
#ifndef PIO_NCO_PHI_BASE
#define PIO_NCO_PHI_BASE 0x0
#endif

//void GetInputString( char* entry, int size, FILE * stream );

int main()
{
	//alt_u32 phi_val = 42949673;
	double freq = 1000000.0;//phi_val*0.023283064365f;//*100000000.0/4294967296.0;

	alt_u32 phi_val = (freq * 42.94967296) + 0.5;

	IOWR_ALTERA_AVALON_PIO_DATA(PIO_NCO_PHI_BASE,phi_val);
	printf("set freq %lu phi %lu\n", (alt_u32)freq, phi_val);

	return 0;
}


