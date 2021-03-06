/**
 *****************************************************************************
 * @file        switchesIRQhandler.c
 * @author      Michael Riedel
 * @author      Marc Kossmann
 * @version     v1.0.0
 * @date        11.11.2014
 * @brief       IRQ-handler for switches
 *****************************************************************************
 * @par History:
 * @details     v0.1.0 21.10.2014 Riedel & Kossmann
 *              - first draft for milestone 1b
 * @details     v0.1.1 27.10.2014 Riedel
 *              - basic implementation
 * @details     v0.1.2 29.10.2014 Kossmann
 *              - modified clearing requests and evaluating pressed keys
 * @details     v0.1.3 30.10.2014 Riedel
 *              - added Debug and Error-Handling
 * @details     v0.1.4 30.10.2014 Kossmann
 *              - change IPC to message queue because mailbox not needed
 * @details     v0.1.5 31.10.2014 Kossmann
 *              - fix bug that IRQhandler was called all the time
 * @details     v0.1.6 04.11.2014 Riedel & Kossmann
 *              - removed debug printouts because they are critical
 *              - added flushing queue before posting
 * @details     v1.0.0 11.11.2014 Riedel & Kossmann
 *              - replaced messageQueue with SW_UPDATE_EVENT
 *              - moved PIO_SW_GetValues() in InputTask
 *****************************************************************************
 */

#include "../INC/switchesIRQhandler.h"

void switchesIRQhandler(void *context) {
  uint8_t err;

  OSIntEnter();

  OSFlagPost(userInputTaskFlagsGrp, SW_UPDATE_EVENT, OS_FLAG_SET, &err);
  if (OS_NO_ERR != err) {
    error("SW_ISR_FLAG_ERR: %i\n", err);
  }
  // reset IR-Bits
  PIO_SW_ClearEdgeCptBits(
      PIO_SW_LR_MSK | PIO_SW_MODE_MSK | PIO_SW_DEBUG_MSK);

  OSIntExit();
}
