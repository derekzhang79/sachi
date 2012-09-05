//
//  AumViewController.m
//  HappySachi
//
//  Created by Ben Boral on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AumViewController.h"
#import "FlurryAnalytics.h"


@interface AumViewController ()

@end

@implementation AumViewController
@synthesize bgImg;
@synthesize goToColorsButton;
@synthesize goColorsImg;
@synthesize goBackImg;
@synthesize goBackButton;
@synthesize muteButton;
@synthesize muteImg;
@synthesize bigSmile;
@synthesize leftEye;
@synthesize rightEye;
@synthesize sachiTap;
@synthesize player;

-(void)setUpSharedStuff{
    NSLog(@"AumViewController:SetUpSharedStuff");
    
    
    [FlurryAnalytics logEvent:@"OnAumPage"];
    
    //Creating the button to go next screen
    goColorsImg=[UIImage imageNamed:@"Go.png"];
    goToColorsButton.frame=CGRectMake((self.view.frame.size.width-self.goColorsImg.size.width), (self.view.frame.size.height-self.goColorsImg.size.height), self.goColorsImg.size.width, self.goColorsImg.size.height);
    [goToColorsButton setBackgroundImage:goColorsImg forState:UIControlStateNormal];
    goToColorsButton.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin);
    [goToColorsButton setHidden:YES];
    [self.view addSubview:goToColorsButton];


    
    //Creating the button to go back a screen
    goBackImg=[UIImage imageNamed:@"GoBack.png"];
    goBackButton=[UIButton buttonWithType:UIButtonTypeCustom];
    goBackButton.frame=CGRectMake(0, self.view.frame.size.height-self.goBackImg.size.height , self.goBackImg.size.width, self.goBackImg.size.height);
    [goBackButton setBackgroundImage:goBackImg forState:UIControlStateNormal];
    [goBackButton addTarget:self.navigationController action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    goBackButton.autoresizingMask=UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:goBackButton];

    sachiTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playSound)];
    [self.view addGestureRecognizer:sachiTap];
    sachiTap.delegate=self;
    sachiTap.enabled=NO;
}


-(void)playSound{

    sachiTap.enabled=NO;
    bigSmile=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FullSmile.png"]];
    CGRect starter=CGRectMake(164, 195, 0, 0);
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
        {
            starter=CGRectMake(512, 252, 0, 0);
            NSLog(@"land");
        }
        else {
            starter=CGRectMake(380, 400, 0, 0);
            NSLog(@"port");
        }
    }
    bigSmile.frame=starter;
    [self.view addSubview:bigSmile];
        
    rightEye=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FullSmile.png"]];
    CGRect starterR=CGRectMake(170, 160, 15, 0);
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
        {
            starterR=CGRectMake(526, 170, 42, 0);
            NSLog(@"land");
        }
        else {
            starterR=CGRectMake(395, 310, 40, 0);
            NSLog(@"port");
        }
    }
    rightEye.frame=starterR;
    [self.view addSubview:rightEye];
        
    leftEye=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FullSmile.png"]];
    CGRect starterL=CGRectMake(143, 160, 15, 0);
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
        {
            starterL=CGRectMake(457, 170, 42, 0);
            NSLog(@"land");
        }
        else {
            starterL=CGRectMake(325, 310, 40, 0);
            NSLog(@"port");
        }
    }
    leftEye.frame=starterL;
    [self.view addSubview:leftEye];
    [self animateMouth];
        
        
        
    NSString* audioString = [[NSBundle mainBundle] pathForResource:@"SachiAum" ofType:@"caf"];
        
    NSString* expandedPath = [audioString stringByExpandingTildeInPath];
    NSURL* audioUrl = [NSURL fileURLWithPath:expandedPath];
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"])
    {
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:nil];
        [player setDelegate:self];
        [self.player play];
    }

}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)playedSuccessfully {
    self.player = nil;
}

-(void)animateMouth{
    CGRect midder=CGRectMake(156, 190, 15, 15);
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
        {
            midder=CGRectMake(487, 227, 50, 50);
            NSLog(@"land");
        }
        else {
            midder=CGRectMake(355, 375, 50, 50);
            NSLog(@"portrait");
        }
    }
    
    CGRect midR=CGRectMake(169, 160, 18, 20);
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
        {
            midR=CGRectMake(524, 170, 46, 49);
            NSLog(@"land");
        }
        else {
            midR=CGRectMake(393, 310, 44, 49);
            NSLog(@"port");
            
        }
    }
    
    CGRect midL=CGRectMake(141, 160, 18, 20);
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
        {
            midL=CGRectMake(455, 170, 46, 49);
            NSLog(@"land");
        }
        else {
            midL=CGRectMake(323, 310, 44, 49);
            NSLog(@"port");
            
        }
    }
    
    
    
    [UIImageView animateWithDuration:2 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
        bigSmile.frame=midder;
        leftEye.frame=midL;
        rightEye.frame=midR;
        }
                          completion:^(BOOL finished){
                              [self unanimateIt];
                          }];
    
}

-(void)unanimateIt{
    NSLog(@"unanimating");
    CGRect ender=CGRectMake(159, 195, 10, 0);
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
        {
            ender=CGRectMake(507, 252, 10, 0);
            NSLog(@"land");
        }
        else {
            ender=CGRectMake(375, 400, 10, 0);
            NSLog(@"port");
            
        }
    }
    CGRect starterR=CGRectMake(169, 160, 15, 0);
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
        {
            starterR=CGRectMake(526, 170, 42, 0);
            NSLog(@"land");
        }
        else {
            starterR=CGRectMake(395, 310, 40, 0);
            NSLog(@"port");
            
        }
    }
    
    CGRect starterL=CGRectMake(141, 160, 15, 0);
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
        {
            starterL=CGRectMake(457, 170, 42, 0);
            NSLog(@"land");
        }
        else {
            starterL=CGRectMake(325, 310, 40, 0);
            NSLog(@"port");
            
        }
    }
    
    [UIImageView animateWithDuration:6 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
        bigSmile.frame=ender;
        leftEye.frame=starterL;
        rightEye.frame=starterR;}
                          completion:^(BOOL finished){
                              [bigSmile removeFromSuperview];
                              sachiTap.enabled=YES;
                              [self.goToColorsButton setHidden:NO];
                          }];
    
}



- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    
    if ((touch.view == self.goBackButton||touch.view == self.goToColorsButton)) {//change it to your condition
        return NO;
    }
    if(([touch locationInView:self.view].x<0.75*self.view.frame.size.width)&&([touch locationInView:self.view].x>0.25*self.view.frame.size.width)&&([touch locationInView:self.view].y<0.75*self.view.frame.size.height)&&([touch locationInView:self.view].y>0.25*self.view.frame.size.height))
    {
    return YES;
    }
    
    return NO;
}





- (void)viewDidUnload
{
    NSLog(@"ViewController:viewDidLoad");
    [super viewDidUnload];
    
}

@end
