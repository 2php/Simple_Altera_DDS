/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */


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
	//char line[12];
	//char *pend;
	//0x028F5C29
	//alt_u32 phi_val = 42949673;
	double freq = 1000000.0;//phi_val*0.023283064365f;//*100000000.0/4294967296.0;

	//GetInputString( line, sizeof(line), stdin );
	//fgetc();
	//freq = strtod(line, pend);
	//fscanf(stdin, "%lf", &freq);
	//scanf("%lf",&freq);
	alt_u32 phi_val = (freq * 42.94967296) + 0.5;


	IOWR_ALTERA_AVALON_PIO_DATA(PIO_NCO_PHI_BASE,phi_val);
	printf("set freq %lu phi %lu\n", (alt_u32)freq, phi_val);




	return 0;
}

/******************************************************************
*  Function: GetInputString
*
*  Purpose: Parses an input string for the character '\n'.  Then
*           returns the string, minus any '\r' characters it
*           encounters.
*
******************************************************************/
//void GetInputString( char* entry, int size, FILE * stream )
//{
//  int i;
//  int ch = 0;
//
//  for(i = 0; (ch != '\n') && (i < size); )
//  {
//    if( (ch = alt_getchar()) != '\r')
//    {
//      putchar(ch);
//      entry[i] = ch;
//      i++;
//    }
//  }
//}
