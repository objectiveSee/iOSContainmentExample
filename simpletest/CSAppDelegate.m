//
//  CSAppDelegate.m
//  simpletest
//
//  Created by Danny on 9/18/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "CSAppDelegate.h"
#import "CSContainerViewController.h"

@implementation CSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.containerController = [[CSContainerViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = self.containerController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
