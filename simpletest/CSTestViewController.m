//
//  CSTestViewController.m
//  simpletest
//
//  Created by Danny on 9/18/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "CSTestViewController.h"

@interface CSTestViewController ()

@end

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
    
    static BOOL flip = NO;
    self.view.backgroundColor = flip ? [UIColor orangeColor] : [UIColor purpleColor];
    flip = !flip;
    
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;

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
