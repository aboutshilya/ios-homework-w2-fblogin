//
//  FBFeedViewController.m
//  FBLogin
//
//  Created by Shilya Lee on 6/14/14.
//  Copyright (c) 2014 Shilya Lee. All rights reserved.
//

#import "FBFeedViewController.h"

@interface FBFeedViewController ()

- (void) loadFeeds;

@property (weak, nonatomic) IBOutlet UIScrollView *feedView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;


@end

@implementation FBFeedViewController

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
    
    self.navigationItem.title = @"News Feeds";
    
    self.navigationController.navigationBar.BarTintColor = [UIColor colorWithRed:59.0f/255.0f green:89.0f/255.0f blue:152.0f/255.0f alpha:1.0f];
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil];
    
    [self performSelector:@selector(loadFeeds) withObject:nil afterDelay:2];
    
    
}

- (void)loadFeeds{
    
    [self.loadingView stopAnimating];
    
    UIImageView *feedImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FeedView"]];
    feedImg.frame = CGRectMake(0, 44, feedImg.frame.size.width, feedImg.frame.size.height);
    
    [self.feedView addSubview:feedImg];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
