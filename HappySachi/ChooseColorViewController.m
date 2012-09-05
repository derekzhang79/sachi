//
//  ChooseColorViewController.m
//  HappySachi
//
//  Created by Ben Boral on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChooseColorViewController.h"
#import "FlurryAnalytics.h"


@interface ChooseColorViewController ()

@end

@implementation ChooseColorViewController

@synthesize bgImg;
@synthesize goToAnimalsButton;
@synthesize goButtonImg;
@synthesize goBackImg;
@synthesize goBackButton;
@synthesize slider;
@synthesize sliderThumbImg;
@synthesize muteImg;
@synthesize muteButton;
@synthesize selectedColorString;
@synthesize whatColor;
@synthesize cp;
@synthesize player;


-(IBAction)sliderChanged:(UISlider *)sender{
        whatColor.frame = CGRectMake(sender.value*self.view.frame.size.width-0.5*whatColor.frame.size.width, self.view.frame.size.height*0.5-0.5*sliderThumbImg.size.height-whatColor.frame.size.height, [UIImage imageNamed:@"ColorButton.png"].size.width, [UIImage imageNamed:@"ColorButton.png"].size.height);
}

-(void)setUpSharedStuff{
    NSLog(@"ChooseColorViewController:SetUpSharedStuff");

    
    
    
    [FlurryAnalytics logEvent:@"OnColorChooserPage"];
    selectedColorString=[[NSMutableString alloc] initWithString:@"red"];
    
    //Slider to Choose the Color with customizations
    self.sliderThumbImg=[UIImage imageNamed:@"SachiSlider.png"];
    slider=[[MySlider alloc] initWithFrame:CGRectMake(-0.45*(self.sliderThumbImg.size.width), self.view.center.y, self.view.frame.size.width+(0.9*self.sliderThumbImg.size.width), 20)];
    [slider setThumbImage:self.sliderThumbImg forState:UIControlStateNormal];
    [slider setMaximumTrackImage:[UIImage imageNamed:@"transparentTrack.png"] forState:UIControlStateNormal];
    [slider setMinimumTrackImage:[UIImage imageNamed:@"transparentTrack.png"] forState:UIControlStateNormal];
    [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];   
    
    whatColor=[[UIButton alloc] init];
    whatColor=[UIButton buttonWithType:UIButtonTypeCustom];
    [whatColor setBackgroundImage:[UIImage imageNamed:@"ColorButton.png"] forState:UIControlStateNormal];
    whatColor.frame = CGRectMake(-0.5*[UIImage imageNamed:@"ColorButton.png"].size.width, 0.5*self.view.frame.size.height-0.5*self.sliderThumbImg.size.height-[UIImage imageNamed:@"ColorButton.png"].size.height,[UIImage imageNamed:@"ColorButton.png"].size.width,[UIImage imageNamed:@"ColorButton.png"].size.height);
    [whatColor addTarget:self action:@selector(playColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:whatColor];
    
    //Creating the button to go next screen
    goButtonImg=[UIImage imageNamed:@"Go.png"];
    goToAnimalsButton=[UIButton buttonWithType:UIButtonTypeCustom];
    goToAnimalsButton.frame=CGRectMake((self.view.frame.size.width-self.goButtonImg.size.width), (self.view.frame.size.height-self.goButtonImg.size.height), self.goButtonImg.size.width, self.goButtonImg.size.height);
    [goToAnimalsButton setBackgroundImage:goButtonImg forState:UIControlStateNormal];
    goToAnimalsButton.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleTopMargin);
    [self.view addSubview:goToAnimalsButton];
    
    //Creating the button to go back a screen
    goBackImg=[UIImage imageNamed:@"GoBack.png"];
    goBackButton=[UIButton buttonWithType:UIButtonTypeCustom];
    goBackButton.frame=CGRectMake(0, self.view.frame.size.height-self.goBackImg.size.height , self.goBackImg.size.width, self.goBackImg.size.height);
    [goBackButton setBackgroundImage:goBackImg forState:UIControlStateNormal];
    [goBackButton addTarget:self.navigationController action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    goBackButton.autoresizingMask=UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:goBackButton];
    


    
}



-(IBAction)playColor:(id)sender{
    float correctedVal=self.slider.value;
    if(correctedVal>0.98){
        correctedVal=0.98;
    }
        
    const CGFloat* components = CGColorGetComponents([self pixelInfo:correctedVal fromImage:self.bgImg.image].CGColor);
    
    NSString* audioString=[[NSBundle mainBundle] pathForResource:[cp colorNameFromRed:components[0] Green:components[1] Blue:components[2] Pos:self.slider.value] ofType:@"caf"];
    self.selectedColorString=(NSMutableString*)[cp colorNameFromRed:components[0] Green:components[1] Blue:components[2] Pos:self.slider.value];
    NSLog(@"self.selectedColorString is %@", self.selectedColorString);
    
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





-(UIColor *)pixelInfo: (float)withSliderPos fromImage:(UIImage *)image{
    //When the user taps to go to the next view,
    //this method gets the chosen color for later use
    
    NSLog(@"ChooseColorViewController:pixelInfo withSlider Pos from Image");
    
    unsigned char *pixel = malloc(4);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixel, 
                                                 1, 1, 8, 4, colorSpace,
                                                 kCGImageAlphaPremultipliedLast);
    float pixelYPos=-0.15;
    if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
    {
        pixelYPos=-0.01;
    }
    
    CGColorSpaceRelease(colorSpace);
    UIGraphicsPushContext(context);
    [image drawAtPoint:CGPointMake(-withSliderPos*image.size.width, pixelYPos*image.size.height)];
    UIGraphicsPopContext();
    
    CGFloat R = pixel[0];
    CGFloat G = pixel[1];
    CGFloat B = pixel[2];
    R=R/255.0;
    G=G/255.0;
    B=B/255.0;
    
    return [UIColor colorWithRed:R green:G blue:B alpha:1.0];
    
    CGContextRelease(context);
    
}

@end
