//
//  Calculator2Brain.m
//  Calculator2
//
//  Created by Akinbiyi Lalude on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


//  To Do List
//  1. Floating point entry    *** DONE ***
//  2. Add 1/x operand    *** DONE ***
//  3. Add +/- operand    *** DONE ***
//  4. Add Sin() operand
//  5. Add Cos() operand
//  6. Add "Store Current Display" button    *** DONE ***
//  7. Add "Recall Stored Value" button    *** DONE ***
//  8. Add "Mem +" add display value to value in memory
//  9. Add "C" button to clear memoery, display, waiting operations



#import "Calculator2Brain.h"

@implementation Calculator2Brain

- (void)setOperand:(double)anOperand
{
    operand = anOperand;
}

- (void)performWaitingOperation
{
    if ([@"+" isEqual:waitingOperation]) // example of sending a string a message, could have sent waitingOperation a message
    {
        operand = waitingOperand + operand;
    }
    else if ([@"-" isEqual:waitingOperation])
    {
        operand = waitingOperand - operand;
    }
    else if ([@"*" isEqual:waitingOperation])
    {
        operand = waitingOperand * operand;
    }
    else if ([@"/" isEqual:waitingOperation])
    {
        if (operand) // this silently fails for "operand == 0," or division by zero
        {
            operand = waitingOperand / operand;
        }
    }
}

// - (double)performOperation:(NSString *)operation
// {
//     if ([operation isEqual:@"sqrt"]) // without the "@" it is just a constant CHAR*
//     {
//         operand = sqrt(operand);
//     }
//     else
//     {
//         [self performWaitingOperation]; // example of a private method and sending a message to myself
//         waitingOperation = operation; // must record current operation because it becomes the waiting operation
//         waitingOperand = operand; // in the case of "3x5=" these hold "3" and "x"
//     }
//     return operand; // just for the convenience of the caller... otherwise another method called getOperand would be necessary
// }


- (double)performOperation:(NSString *)operation
{
    if ([operation isEqual:@"sqrt"]) // without the "@" it is just a constant CHAR*
    {
        operand = sqrt(operand);
    }
    else if([operation isEqual:@"1/x"])
    {
        if (operand) // this silently fails for "operand == 0," or division by zero
        {
            operand = 1 / operand;
        }
    }
    else if([operation isEqual:@"+/-"])
    {
        operand = -1 * operand;
    }
    else if([operation isEqual:@"MS"]) // MS Button - save display content into memory
    {
        memorySave = operand;
        memoryUsed = YES;
    }
    else if([operation isEqual:@"MR"]) // MR Button - display memory content
    {
        if(memoryUsed)
        {
             operand = memorySave;
        }
    }
    else
    {
        [self performWaitingOperation]; // example of a private method and sending a message to myself
        waitingOperation = operation; // must record current operation because it becomes the waiting operation
        waitingOperand = operand; // in the case of "3x5=" these hold "3" and "x"
    }
    return operand; // just for the convenience of the caller... otherwise another method called getOperand would be necessary
}



- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
