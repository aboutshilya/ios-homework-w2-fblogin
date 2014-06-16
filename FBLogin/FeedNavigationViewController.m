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

@end
