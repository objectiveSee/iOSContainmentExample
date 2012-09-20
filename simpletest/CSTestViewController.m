//
//  CSTestViewController.m
//  simpletest
//
//  Created by Danny on 9/18/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "CSTestViewController.h"

@implementation CSTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSInteger depth = [self.navigationController.viewControllers count];
    self.view.backgroundColor = ( depth % 2 == 0) ? [UIColor orangeColor] : [UIColor purpleColor];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
//    [self.textField becomeFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear, Frame = %@", NSStringFromCGRect(self.view.frame));
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear, Frame = %@", NSStringFromCGRect(self.view.frame));
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)push:(id)sender
{
    CSTestViewController *test = [[CSTestViewController alloc] init];
    [self.navigationController pushViewController:test animated:YES];
}

@end
