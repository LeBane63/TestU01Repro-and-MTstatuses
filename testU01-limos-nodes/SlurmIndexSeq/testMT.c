#include <stdio.h>
#include "mt19937ar.h"
#include <stdlib.h>
#include <TestU01.h> //On utilise juste battery.h dans notre cas.


int main(int argc, char ** argv) {
  // Initialise TestU01
  unif01_Gen* gen = unif01_CreateExternGenBits("MersenneTwiter",genrand_real3);


  restoreStatus(argv[1]);
  bbattery_BigCrush(gen);
 
 
 
  // Clean up.

  unif01_DeleteExternGenBits(gen);
  return 0;
}

