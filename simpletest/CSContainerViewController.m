//
//  CSContainerViewController.m
//  simpletest

#import "CSContainerViewController.h"
#import "CSTestViewController.h"

//#define CONTAINMENT_METHODS_ENABLED

@interface CSContainerViewController ()
@property (nonatomic, strong) UINavigationController *childController;
@end

///////////////////////////////////////////////////////////////

@implementation CSContainerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CSTestViewController *testVC = [[CSTestViewController alloc] init];
        self.childController = [[UINavigationController alloc] initWithRootViewController:testVC];
        
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        [defaultCenter addObserver:self
                          selector:@selector(_keyboardWillHideNotification:)
                              name:UIKeyboardWillHideNotification
                            object:nil];
        [defaultCenter addObserver:self
                          selector:@selector(_keyboardWillShowNotification:)
                              name:UIKeyboardWillShowNotification
                            object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.childController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.childController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
#ifdef CONTAINMENT_METHODS_ENABLED
    [self addChildViewController:self.childController];
    [self.view addSubview:self.childController.view];
    [self.childController didMoveToParentViewController:self];
#else
    [self.view addSubview:self.childController.view];    
#endif
    
//    self.childController.navigationBarHidden = YES;

}

- (void)_keyboardWillHideNotification:(NSNotification *)note
{
    [self _layoutSubviewsWithKeyboardInfo:[note userInfo] keyboardHidden:YES];
}

- (void)_keyboardWillShowNotification:(NSNotification*)note
{
    [self _layoutSubviewsWithKeyboardInfo:[note userInfo] keyboardHidden:NO];
}

- (void)_layoutSubviewsWithKeyboardInfo:(NSDictionary *)info keyboardHidden:(BOOL)isHidden
{
    double duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect keyboardEndFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardEndFrame = [self.view convertRect:keyboardEndFrame fromView:nil];
    CGFloat kheight = keyboardEndFrame.size.height;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, isHidden ? 0 : kheight, 0);
    CGRect baseFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
#ifdef CONTAINMENT_METHODS_ENABLED
    [self.childController beginAppearanceTransition:YES animated:YES];
#endif
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:0
                     animations:^{
                         UIViewController *topController = self.childController.topViewController;
//                         self.childController.view.frame = UIEdgeInsetsInsetRect(baseFrame, insets);
                         topController.view.frame = UIEdgeInsetsInsetRect(baseFrame, insets);
                         NSLog(@"Setting child frame to %@", NSStringFromCGRect(topController.view.frame));
                     } completion:^(BOOL finished) {
                         NSCAssert(finished == YES, @"Logic error. expected animation to finish");
#ifdef CONTAINMENT_METHODS_ENABLED
                         [self.childController endAppearanceTransition];
#endif
                     }];
    
}

@end
