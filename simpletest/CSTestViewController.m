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
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)push:(id)sender
{
    static BOOL flip = NO;
    
    CSTestViewController *test = [[CSTestViewController alloc] init];
    test.view.backgroundColor = flip ? [UIColor orangeColor] : [UIColor purpleColor];
    flip = !flip;
    [self.navigationController pushViewController:test animated:YES];
}

@end
