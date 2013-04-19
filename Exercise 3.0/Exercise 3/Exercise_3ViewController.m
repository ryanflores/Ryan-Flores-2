//
//  Exercise_3ViewController.m
//  Exercise 3
//
//  Created by Ryan Flores on 4/19/13.
//  Copyright (c) 2013 JHON RYAN FLORES. All rights reserved.
//

#import "Exercise_3ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface Exercise_3ViewController ()

@end

@implementation Exercise_3ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view.layer setBackgroundColor:[UIColor orangeColor].CGColor];
    [self.view.layer setCornerRadius:20];
    [self.view.layer setFrame:CGRectInset(self.view.layer.frame, 20, 20)];
    
    sublayer = [CALayer layer];
    [sublayer setBackgroundColor:[UIColor blueColor].CGColor];
    [sublayer setShadowOffset:CGSizeMake(0, 3)];
    [sublayer setShadowRadius:5.0];
    [sublayer setShadowColor:[UIColor blackColor].CGColor];
    [sublayer setShadowOpacity:0.8];
    [sublayer setFrame:CGRectMake(30, 30, 128, 192)];
    [sublayer setBorderColor:[UIColor blackColor].CGColor];
    [sublayer setBorderWidth:2.0];
    [sublayer setCornerRadius:10.0];
    [self.view.layer addSublayer:sublayer];
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = sublayer.bounds;
    imageLayer.cornerRadius = 10.0;
    imageLayer.contents = (id) [UIImage imageNamed:@"battlemap.png"].CGImage;
    imageLayer.masksToBounds = YES;
    [sublayer addSublayer:imageLayer];
}

-(IBAction)jump:(id)sender
{
    CAKeyframeAnimation *jump2Animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [jump2Animation setCalculationMode:kCAAnimationPaced];
    [jump2Animation setFillMode:kCAFillModeForwards];
    [jump2Animation setRemovedOnCompletion:NO];
    [jump2Animation setBeginTime: CACurrentMediaTime()+2];
    [jump2Animation setRepeatCount:2];
    [jump2Animation setDuration:5];
    
    CGMutablePathRef curved2Path = CGPathCreateMutable();
    CGPathMoveToPoint(curved2Path, NULL, 130, 180);
    CGPathAddQuadCurveToPoint(curved2Path, NULL, 125, 130, 120, 150);   //(forwarPoint, forwardUpPoint, FinalX, finalY)
    CGPathAddQuadCurveToPoint(curved2Path, NULL, 115, 130, 110, 155);
    CGPathAddQuadCurveToPoint(curved2Path, NULL, 105, 130, 100, 155);
    CGPathAddQuadCurveToPoint(curved2Path, NULL, 95, 130, 90, 150);
    CGPathAddQuadCurveToPoint(curved2Path, NULL, 85, 130, 80, 150);
    
    [jump2Animation setPath:curved2Path];
    CGPathRelease(curved2Path);
    [sublayer addAnimation:jump2Animation forKey:@"moveAnimation"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
