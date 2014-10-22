/**
  ***************************************************************************
  * @file      	switchesIRQhandler.c
  * @author  	Michael Riedel
  * @author  	Marc Kossmann
  * @version   	V0.1
  * @date      	21.10.2014
  * @brief  	IRQ-handler for switches
  ***************************************************************************
  * @par History:
  * @details V0.1 Riedel & Kossmann
  *			- first draft for milestone 1b
  ****************************************************************************
  */

#include <system.h>
#include <sys/alt_irq.h>
#include <stdint.h>
#include "includes.h"
#include "../INC/hardwareAccess.h"

/**
  * @brief      IRQ-Handler for switches
  * @details    sets an event, when an switch changed and stores all switch values
  *             in message queue
  * @param      context : pointer to context variable (not used)
  * @retval none
  */
 void switchesIRQhandler(void * context)
{
}


