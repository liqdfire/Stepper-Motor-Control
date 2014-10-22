/**
  ******************************************************************************
  * @file    	userInputTask.h
  * @author  	Michael Riedel
  * @author  	Marc Kossmann
  * @version   	V0.1
  * @date      	22.10.2014
  * @brief   	Header file for userInputTask.c
  * @details 	Contains defines, includes, typedefs and declarations needed for
  *             this task.
  ******************************************************************************
  * @par History:
  * @details V0.1 Riedel & Kossmann
  *			- first draft for milestone 1b
  ********************************************************************************
  */

#ifndef __USER_INPUT_TASK_H__
#define __USER_INPUT_TASK_H__

#include <sys/alt_irq.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include "includes.h"
#include "hardwareAccess.h"
#include "../INC/heartbeatTask.h"

#define KEY0_RS_EVENT			(0x1)
#define KEY2_MINUS_EVENT		(0x2)
#define KEY3_PLUS_EVENT			(0x4)
#define SWITCH_UPDATE_EVENT		(0x8)
#define MOTOR_STOP_EVENT		(0x10)

#define CTRL_REG_RS_MSK			(0x1)
#define CTRL_REG_LR_MSK			(0x2)
#define CTRL_REG_MODE_MSK		(0x3C)
#define CTRL_REG_IE_MSK			(0x40)
#define CTRL_REG_IR_MSK			(0x80)

#define SWITCH_LR_MSK			(0x1)
#define SWITCH_MODE_MSK			(0x1E)
#define SWITCH_DEBUG_MSK		(0x200)

#define MODE_STOP_CON_RUN_MSK	(0x3)
#define MODE_STOP				(0x0)
#define MODE_CON_RUN			(0x1)
#define MODE_CH_OF_ST_1_4		(0x2)
#define MODE_CH_OF_ST_1_2		(0x6)
#define MODE_CH_OF_ST_1			(0xA)
#define MODE_CH_OF_ST_2			(0xE)

typedef struct outputTaskMailbox {
	uint32_t ctrlReg;
	uint32_t speedReg;
	uint32_t stepsReg;
	bool debugState;
}outputTaskMailbox_t;

typedef struct systemState {
	state_t operationalStatus;
	useCases_t activeUseCase;
}systemState_t;

typedef enum state{
	ERROR				= 0,
    FUNCTIONAL			= 1,
	DEBUG				= 2,
}state_t;

typedef enum useCases{
	STOP 				= 0,
	QUARTER_ROTATION	= 1,
	HALF_ROTATION		= 2,
	FULL_ROTATION		= 3,
	DOUBLE_ROTATION		= 4,
	CONTINOUS 			= 5
}useCases_t;

typedef enum direction{
	LEFT = 0,
	RIGHT = 1
}direction_t;

typedef struct motorState{
	bool running;
	direction_t direction;
}motorState_t;

void UserInputTask(void * pdata);

#endif
