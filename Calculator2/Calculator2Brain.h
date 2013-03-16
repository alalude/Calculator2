//
//  Calculator2Brain.h
//  Calculator2
//
//  Created by Akinbiyi Lalude on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator2Brain : NSObject {
    double operand;
    NSString *waitingOperation;
    double waitingOperand;
    double memorySave; //   *** Adesina Code ***
    BOOL memoryUsed; //   *** Adesina Code ***
}

- (void)setOperand:(double)anOperand;
- (double)performOperation:(NSString *)operation;

@end
