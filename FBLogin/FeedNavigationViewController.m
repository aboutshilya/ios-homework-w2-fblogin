//
//  FeedNavigationViewController.m
//  FBLogin
//
//  Created by Shilya Lee on 6/15/14.
//  Copyright (c) 2014 Shilya Lee. All rights reserved.
//

#import "FeedNavigationViewController.h"

@interface FeedNavigationViewController ()

-(void)loadFeed;
-(void)onRightButton;
-(void)onLeftButton;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation FeedNavigationViewController

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
    // Do any additional setup after loading the view from its nib.
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.navigationItem.title = @"News Feed";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:59.0f/255.0f green:89.0f/255.0f blue:152.0f/255.0f alpha:1.0f];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    // Configure the right button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"SearchIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(onLeftButton)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
    // Configure the right button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"UserIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage
                                                                    style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(onRightButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.scrollView.contentSize = CGSizeMake(320,640);
    
    [self performSelector:@selector(loadFeed) withObject:nil afterDelay:2];
   
    
}

- (void) loadFeed{
    [self.loadingView stopAnimating];

    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FeedView"]];
    iv.frame = CGRectMake(0.0, 0.0, iv.frame.size.width, iv.frame.size.height);
    [self.scrollView addSubview:iv];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onLeftButton
{
    NSLog(@"-[%@ %@]", [self class], NSStringFromSelector(_cmd));
}

- (void)onRightButton
{
    NSLog(@"-[%@ %@]", [self class], NSStringFromSelector(_cmd));
}


@end
