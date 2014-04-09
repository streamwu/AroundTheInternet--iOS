//
//  WebViewController.h
//  AroundTheInternet
//
//  Created by StreamWu on 2/7/14.
//  Copyright (c) 2014 Stream Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sites.h"
#import "Social/Social.h"

@interface WebViewController : UIViewController
@property(strong,nonatomic) Sites *site;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;

@end
