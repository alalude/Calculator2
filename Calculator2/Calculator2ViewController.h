//
//  Calculator2ViewController.h
//  Calculator2
//
//  Created by Akinbiyi Lalude on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator2Brain.h"

@interface Calculator2ViewController : UIViewController

{
    IBOutlet UILabel *display;
    Calculator2Brain *brain;
    BOOL userIsInTheMiddleOfTypingANumber;
    BOOL decimalFlag; //   *** Adesina Code ***
}

- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;


@end
