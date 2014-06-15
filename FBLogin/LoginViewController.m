//
//  LoginViewController.m
//  FBLogin
//
//  Created by Shilya Lee on 6/14/14.
//  Copyright (c) 2014 Shilya Lee. All rights reserved.
//

#import "LoginViewController.h"
#import "FeedNavigationViewController.h"

@interface LoginViewController ()

- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;
- (void)loadFeedView;

@property (weak, nonatomic) IBOutlet UIView *inputsContainer;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIImageView *FBLogo;
@property (weak, nonatomic) IBOutlet UILabel *signUpLabel;

@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;


- (IBAction)validateInput:(id)sender;
- (IBAction)onLoginButton:(id)sender;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //set up background color
    UIColor *bgColor = [UIColor colorWithRed:59.0f/255.0f green:89.0f/255.0f blue:152.0f/255.0f alpha:1.0f];
    self.view.backgroundColor = bgColor;
    
    [self.loadingView stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    [UIView animateWithDuration:animationDuration
                        delay:0.0
                        options:(animationCurve << 16)
                        animations:^{
                            self.FBLogo.frame = CGRectMake(self.FBLogo.frame.origin.x , self.view.frame.size.height - kbSize.height - 297, self.FBLogo.frame.size.width, self.FBLogo.frame.size.height);
                            self.inputsContainer.frame = CGRectMake(self.inputsContainer.frame.origin.x , self.view.frame.size.height - kbSize.height - 217, self.inputsContainer.frame.size.width, self.inputsContainer.frame.size.height);
                            self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x , self.view.frame.size.height - kbSize.height - 122, self.loginButton.frame.size.width, self.loginButton.frame.size.height);
                            self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, self.view.frame.size.height - kbSize.height - 55, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
                             self.loadingView.frame = CGRectMake(self.loadingView.frame.origin.x,  self.view.frame.size.height - kbSize.height - 106, self.loadingView.frame.size.width, self.loadingView.frame.size.height);
                            
                        }
                        completion:nil];
    
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.FBLogo.frame = CGRectMake(self.FBLogo.frame.origin.x , 110, self.FBLogo.frame.size.width, self.FBLogo.frame.size.height);
                         self.inputsContainer.frame = CGRectMake(self.inputsContainer.frame.origin.x , 212, self.inputsContainer.frame.size.width, self.inputsContainer.frame.size.height);
                         self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x , 314, self.loginButton.frame.size.width, self.loginButton.frame.size.height);
                         self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, 471, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
                         self.loadingView.frame = CGRectMake(self.loadingView.frame.origin.x,  340, self.loadingView.frame.size.width, self.loadingView.frame.size.height);
                     }
                     completion:nil];
    
}

- (IBAction)validateInput:(id)sender {
    if(self.passwordTextField.text.length > 1 && self.idTextField.text.length > 1){
            self.loginButton.enabled = YES;
    }else{
            self.loginButton.enabled = NO;
    }
}

- (IBAction)onLoginButton:(id)sender {
    
    if([self.passwordTextField.text  isEqual: @"0000"] && [self.idTextField.text  isEqual: @"yahoo"]){
    
        self.loginButton.selected = YES;
        [self.loadingView startAnimating];
        
        [self performSelector:@selector(loadFeedView) withObject:nil afterDelay:2];
    
    }else{
        
        self.loginButton.enabled = NO;
        self.passwordTextField.text = @"";
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The Password you entered in incorrect. Please try again!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (void)loadFeedView {
    [self.loadingView stopAnimating];

    FeedNavigationViewController *feedNavVC = [[FeedNavigationViewController alloc] init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] initWithNibName:@"tabBarController" bundle:nil];

    tabBarController.tabBar.frame = CGRectMake(0, 524, 320, 320);
    
    tabBarController.tabBar.backgroundImage = [UIImage imageNamed:@"TabBar"];
    
    tabBarController.viewControllers = @[feedNavVC];

   
    [self presentViewController:tabBarController animated:YES completion: nil];
   
}



@end
