//
//  Calculator2AppDelegate.h
//  Calculator2
//
//  Created by Akinbiyi Lalude on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// ------------------
// Branch = newideas
// ------------------

#import <UIKit/UIKit.h>

@class Calculator2ViewController;

@interface Calculator2AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Calculator2ViewController *viewController;

@end
