//
//  ViewController.m
//  AroundTheInternet
//
//  Created by StreamWu on 2/7/14.
//  Copyright (c) 2014 Stream Wu. All rights reserved.
//

#import "HomeViewController.h"
#import "Sites.h"
#import "CircleView.h"
#import "WebViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Create 6 Sites objects and store them into the array
    Sites *apple = [[Sites alloc] init];
    apple.siteName = @"Apple";
    apple.siteUrl = [NSURL URLWithString:@"http://www.apple.com"];
    
    Sites *google = [[Sites alloc] init];
    google.siteName = @"Google";
    google.siteUrl = [NSURL URLWithString:@"https://www.google.com"];
    
    Sites *yahoo = [[Sites alloc] init];
    yahoo.siteName = @"Yahoo!";
    yahoo.siteUrl = [NSURL URLWithString:@"http://www.yahoo.com"];
    
    Sites *amazon = [[Sites alloc] init];
    amazon.siteName = @"Amazon";
    amazon.siteUrl = [NSURL URLWithString:@"http://www.amazon.com"];
    
    Sites *facebook = [[Sites alloc] init];
    facebook.siteName = @"Facebook";
    facebook.siteUrl = [NSURL URLWithString:@"http://www.facebook.com"];
    
    Sites *linkedin = [[Sites alloc] init];
    linkedin.siteName = @"Linkedin";
    linkedin.siteUrl = [NSURL URLWithString:@"http://www.linkedin.com"];
    
    _sites = [[NSMutableArray alloc] initWithCapacity:6];
    [self.sites setObject:apple atIndexedSubscript:0];
    [self.sites setObject:google atIndexedSubscript:1];
    [self.sites setObject:yahoo atIndexedSubscript:2];
    [self.sites setObject:amazon atIndexedSubscript:3];
    [self.sites setObject:facebook atIndexedSubscript:4];
    [self.sites setObject:linkedin atIndexedSubscript:5];
 
    
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@">>>>>> viewDidAppear");
    [super viewDidAppear:animated];
    
    //Draw circle
    self.circleView = [[CircleView alloc] initWithFrame:CGRectMake(10, 10, 300, 190)];
    [self.circleView setBackgroundColor:[UIColor clearColor]];
    [self.circleView setNeedsDisplay];
    [self.view addSubview:self.circleView];
    
    //Add buttons
    UIButton *button;
    for (int i = 0; i < [self.sites count]; i++) {
        
        //Retrieve site from the array using the loop index
        Sites *currentSite = [self.sites objectAtIndex:i];
        
        //Create a new button and position it based on the index
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(170*(i%2)+40, 120*(i/2)+210, 70, 30);
        button.tag = i;
        //        button.backgroundColor = [UIColor lightGrayColor];
        //        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:currentSite.siteName forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        //Add the button to the scroll view
        [self.view addSubview:button];
        
    }
    NSLog(@">>>>>> buttons");
    
    //splashView before homeView
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasRunBefore = [defaults boolForKey:@"FirstRun"];
    if (!hasRunBefore) {
        [defaults setBool:YES forKey:@"FirstRun"];
        [defaults synchronize];
        self.splashController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SplashScreenViewController"];
        [self.view.window addSubview:self.splashController.view ];
        [self performSelector:@selector(hideSplash) withObject:nil afterDelay:2];
    }
    
    
}

-(void)hideSplash
{
    [UIView transitionFromView:self.splashController.view
                        toView:nil
                      duration:2
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished) {
                        [self.splashController.view removeFromSuperview];
                    }];
    
}


- (void)buttonTapped:(UIButton*)sender{
    NSLog(@"The button was tapped:%@", sender);
    
    //Trigger the segue
    [self performSegueWithIdentifier:@"segueToWebViewController" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //Cast the parameter "sender" to a UIButton
    UIButton *button = (UIButton *)sender;
    Sites *currentSite = [self.sites objectAtIndex:button.tag];
    
    //Test for the segue we expect; useful if you have different segue possible
    if([segue.identifier isEqualToString:@"segueToWebViewController"]){
        //Get a pointer to the view controller that will appear
        WebViewController *avc = (WebViewController*)segue.destinationViewController;
        
        //Set the animal view controller
        avc.site = currentSite;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
