//
//  ViewController.h
//  AroundTheInternet
//
//  Created by StreamWu on 2/7/14.
//  Copyright (c) 2014 Stream Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleView.h"
#import "SplashScreenViewController.h"

@interface HomeViewController : UIViewController
@property (strong,nonatomic) NSMutableArray *sites;
@property (strong,nonatomic) CircleView *circleView;
@property (strong,nonatomic) SplashScreenViewController *splashController;

@end
