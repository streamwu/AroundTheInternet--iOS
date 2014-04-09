//
//  CircleView.m
//  AroundTheInternet
//
//  Created by StreamWu on 2/7/14.
//  Copyright (c) 2014 Stream Wu. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)drawRect:(CGRect)rect{
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 0, 0, 255, 1);
    CGContextSetLineWidth(ctx, 8);
    CGContextStrokeEllipseInRect(ctx, CGRectMake(120, 90, 60, 60));
    NSLog(@">>>>>> circle");
}

@end
