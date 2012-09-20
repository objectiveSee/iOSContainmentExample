//
//  CSTestViewController.h
//  simpletest
//
//  Created by Danny on 9/18/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSTestViewController : UIViewController <UITextFieldDelegate>

- (IBAction)push:(id)sender;

@property (weak, nonatomic, readonly) IBOutlet UITextField *textField;

@end
