//
//  Calculator2ViewController.m
//  Calculator2
//
//  Created by Akinbiyi Lalude on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


//  To Do List
//  1. Floating point entry   *** DONE ***
//  2. Add 1/x operand    *** DONE ***
//  3. Add +/- operand    *** DONE ***
//  4. Add Sin() operand
//  5. Add Cos() operand
//  6. Add "Store Current Display" button    *** DONE ***
//  7. Add "Recall Stored Value" button    *** DONE ***
//  8. Add "Mem +" add display value to value in memory
//  9. Add "C" button to clear memoery, display, waiting operations



#import "Calculator2ViewController.h"

@implementation Calculator2ViewController

- (Calculator2Brain *) brain //all the things in our view got created by interface builder, but Calculator brain does not exist until implemented here
{
    if (!brain) // if my instance variable brain is not set yet, or "!brain" / "not brain", then set it
    {
        brain = [[Calculator2Brain alloc] init];
    }
    return brain;
    // this lazy instantiation is great for embedded devices because you don't want to allocate memory until you have to
}


// now working on implementing decimal point

// - (IBAction)digitPressed:(UIButton *)sender
// {
//     NSString *digit = [[sender titleLabel] text]; // "digit" equals the text on the label of the button pressed
//     
//     if (userIsInTheMiddleOfTypingANumber)
//     {
//         [display setText:[[display text] stringByAppendingString:digit]]; // if the user is in the middle of typing a number then the display wants to be updated by having the current text in the display, "what's returned by [display text]" appended by the digit pressed, "digit"
//     }
//     
//     else
//     {
//         [display setText:digit]; // otherwise just set the display to "digit," the digit pressed
//         userIsInTheMiddleOfTypingANumber = YES; // now the user is in the middle of typing a number
//     }
// }


- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [[sender titleLabel] text]; // "digit" equals the text on the label of the button pressed
    
    if (userIsInTheMiddleOfTypingANumber)
    {
        if([digit isEqual:@"."])
        {
             if(!decimalFlag)
             {
                 [display setText:[[display text] stringByAppendingString:digit]];
                 decimalFlag = YES;
             }
             else
             {
                 [display setText:[display text]];
             }        
        }
        else
        {
             [display setText:[[display text] stringByAppendingString:digit]];
        }
    }
    
    else
    {
        if([digit isEqual:@"."])
        {
             [display setText:@"0."];
             decimalFlag = YES;             
        }
        else
        {
             [display setText:digit]; // otherwise just set the display to "digit," the digit pressed             
        }
        userIsInTheMiddleOfTypingANumber = YES; // now the user is in the middle of typing a number
    }
}


- (IBAction)operationPressed:(UIButton *)sender // "sender" is my button pressed
{
    if (userIsInTheMiddleOfTypingANumber) // this is necessary because an operand can be more than one digit
    {
        [[self brain] setOperand:[[display text] doubleValue]]; // brain set your display's text to be an operand converted to a double
        userIsInTheMiddleOfTypingANumber = NO;
        decimalFlag = NO; //   *** Adesina Code ***
    }
    NSString *operation = [[sender titleLabel] text]; // sender (the button pressed), what's your label, okay now tell me the text on that label
    double result = [[self brain] performOperation:operation]; // execute the operation in line above and create brain if necessary
    [display setText:[NSString stringWithFormat:@"%g", result]]; // finally set the result in the display
}


@end
