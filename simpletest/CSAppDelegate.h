//
//  CSAppDelegate.h
//  simpletest
//
//  Created by Danny on 9/18/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CSContainerViewController;

@interface CSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CSContainerViewController *containerController;

@end
