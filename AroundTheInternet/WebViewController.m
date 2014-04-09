//
//  WebViewController.m
//  AroundTheInternet
//
//  Created by StreamWu on 2/7/14.
//  Copyright (c) 2014 Stream Wu. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()


@end

@implementation WebViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //display the site
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:self.site.siteUrl];
    [self.webView loadRequest:requestObj];
    self.webView.scalesPageToFit = true;
    
//    //add three UIBarButtons
//    UIBarButtonItem *refresh =
//    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
//                                                  target:self action:@selector(barButtonTapped:)];
//    UIBarButtonItem *rewind =
//    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
//                                                  target:self action:@selector(barButtonTapped:)];
//    UIBarButtonItem *forward =
//    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
//                                                  target:self action:@selector(barButtonTapped:)];
}


- (IBAction)refreshTapped:(UIBarButtonItem *)sender {
    [self.webView reload];
}


- (IBAction)rewindTapped:(UIBarButtonItem *)sender {
    [self.webView goBack];
}


- (IBAction)forwardTapped:(UIBarButtonItem *)sender {
    [self.webView goForward];
}

- (IBAction)sentTweet:(UIBarButtonItem *)sender {
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                            composeViewControllerForServiceType:SLServiceTypeTwitter];
    NSString *tweetContent = @"I'm browsing ";
    tweetContent = [tweetContent stringByAppendingString:[self.site.siteUrl absoluteString]];
    [tweetSheet setInitialText:tweetContent];
    [self presentViewController:tweetSheet animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
