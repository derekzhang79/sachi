//
//  SeeViewController.m
//  HappySachi
//
//  Created by Ben Boral on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SeeViewController.h"
#import "FlurryAnalytics.h"
#import "ColorPicker.h"



@interface SeeViewController ()

@end

@implementation SeeViewController
@synthesize chosenAnimal, thaColor;
@synthesize bgImg;
@synthesize goToColorsButton;
@synthesize goColorsImg;
@synthesize goAnimalsImg;
@synthesize goAnimalsButton;
@synthesize replayImg;
@synthesize replayButton;
@synthesize beImg;
@synthesize beButton;
@synthesize selectedColorString;
@synthesize muteButton;
@synthesize muteImg;
@synthesize goBackImg;
@synthesize goBackButton;
@synthesize rawrImg;
@synthesize rawrButt;
@synthesize player;
@synthesize player2;
@synthesize sliVal;


-(void)setUpSharedStuff{
    NSLog(@"SeeViewController:SetUpSharedStuff");
    
    
    [FlurryAnalytics logEvent:@"See Screen"];
    
    self.view.backgroundColor=thaColor;
    
    //Creating the button to go to next screen
    beImg=[UIImage imageNamed:@"Be.png"];
    beButton=[UIButton buttonWithType:UIButtonTypeCustom];
    beButton.frame=CGRectMake((self.view.frame.size.width-self.beImg.size.width), (self.view.frame.size.height-self.beImg.size.height), self.beImg.size.width, self.beImg.size.height);
    [beButton setBackgroundImage:beImg forState:UIControlStateNormal];
    beButton.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleTopMargin);
    [beButton addTarget:delegate action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beButton];
    
    //Creating the button to go back to replay intro audio
    replayImg=[UIImage imageNamed:@"Replay.png"];
    replayButton=[UIButton buttonWithType:UIButtonTypeCustom];
    replayButton.frame=CGRectMake(self.replayImg.size.width, 0, self.replayImg.size.width, self.replayImg.size.height);
    [replayButton setBackgroundImage:replayImg forState:UIControlStateNormal];
    [replayButton addTarget:self action:@selector(playAudio:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:replayButton];
    
    //Creating the button to go back to color chooser screen
    goColorsImg=[UIImage imageNamed:@"goBackColor.png"];
    goToColorsButton=[UIButton buttonWithType:UIButtonTypeCustom];
    goToColorsButton.frame=CGRectMake(0, goColorsImg.size.height, goColorsImg.size.width, goColorsImg.size.height);
    [goToColorsButton setBackgroundImage:goColorsImg forState:UIControlStateNormal];
    //goToColorsButton.autoresizingMask=UIViewAutoresizingFlexibleTopMargin;
    [goToColorsButton addTarget:self action:@selector(goColors:) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"goToColorsButton is %@", goToColorsButton);
    [self.view addSubview:goToColorsButton];
    
    //Creating the button to go back to animal screen
    goBackImg=[UIImage imageNamed:@"GoBack.png"];
    goBackButton=[UIButton buttonWithType:UIButtonTypeCustom];
    goBackButton.frame=CGRectMake(0, self.view.frame.size.height-self.goBackImg.size.height  , self.goBackImg.size.width, self.goBackImg.size.height);
    [goBackButton setBackgroundImage:goBackImg forState:UIControlStateNormal];
    goBackButton.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin);
    [goBackButton addTarget:self.navigationController action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackButton];
    
    muteImg=[[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"] ? [UIImage imageNamed:@"Unmute.png"] : [UIImage imageNamed:@"Mute.png"];    muteButton=[UIButton buttonWithType:UIButtonTypeCustom];
    muteButton.frame=CGRectMake(self.view.frame.size.width-(self.muteImg.size.width), 0 , self.muteImg.size.width, self.muteImg.size.height);
    [muteButton setBackgroundImage:muteImg forState:UIControlStateNormal];
    muteButton.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin);
    [muteButton addTarget:self action:@selector(changeMute:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:muteButton];
    
    
        //Creating the button to go back to animal screen
        goAnimalsImg=[UIImage imageNamed:@"AnimalsImg.png"];
        goAnimalsButton=[UIButton buttonWithType:UIButtonTypeCustom];
        goAnimalsButton.frame=CGRectMake(0, 2*self.goColorsImg.size.height , self.goAnimalsImg.size.width, self.goAnimalsImg.size.height);
        [goAnimalsButton setBackgroundImage:goAnimalsImg forState:UIControlStateNormal];
        //goAnimalsButton.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin);
        [goAnimalsButton addTarget:self action:@selector(backToAn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:goAnimalsButton];
    
    
    
       
        UITapGestureRecognizer *oneFingerOneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playFX:)];
    oneFingerOneTap.delegate=self;
    [oneFingerOneTap setNumberOfTapsRequired:1];
    [oneFingerOneTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:oneFingerOneTap];
    
    switch (chosenAnimal) {
        case 1: rawrImg=[UIImage imageNamed:@"LadybugNoise.png"]; break;
        case 2: rawrImg=[UIImage imageNamed:@"LionNoise.png"]; break;
        case 3: rawrImg=[UIImage imageNamed:@"BeeNoise.png"]; break;
        case 4: rawrImg=[UIImage imageNamed:@"FrogNoise.png"]; break;
        case 5: rawrImg=[UIImage imageNamed:@"FishNoise.png"]; break;
        case 6: rawrImg=[UIImage imageNamed:@"SnakeNoise.png"]; break;
        case 7: rawrImg=[UIImage imageNamed:@"PigNoise.png"]; break;
        case 8: rawrImg=[UIImage imageNamed:@"ElephantNoise.png"]; break;
        case 9: rawrImg=[UIImage imageNamed:@"FlamingoNoise.png"]; break;
        case 10: rawrImg=[UIImage imageNamed:@"ButterflyNoise.png"]; break;
        case 11: rawrImg=[UIImage imageNamed:@"SheepNoise.png"]; break;
        case 12: rawrImg=[UIImage imageNamed:@"CowNoise.png"]; break;
        case 13: rawrImg=[UIImage imageNamed:@"CatNoise.png"]; break;
        case 14: rawrImg=[UIImage imageNamed:@"DogNoise.png"]; break;
        default:rawrImg=[UIImage imageNamed:@"StarfishNoise.png"]; break;
    }
   
        rawrButt=[UIButton buttonWithType:UIButtonTypeCustom];
        rawrButt.frame=CGRectMake(0.4*self.view.frame.size.width-0.5*rawrImg.size.width, self.view.frame.size.height-rawrImg.size.height, self.rawrImg.size.width, self.rawrImg.size.height);
        [rawrButt setBackgroundImage:rawrImg forState:UIControlStateNormal];
        [rawrButt addTarget:self action:@selector(playAnimalNoise:) forControlEvents:UIControlEventTouchUpInside];
        rawrButt.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin);
        [self.view addSubview:rawrButt];
        
    

}

-(IBAction)backToAn:(id)sender{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:3] animated:YES];
}

-(IBAction)playFX:(UITapGestureRecognizer *)sender{
    
    BOOL willPlay=NO;
        
    NSString *audioString;
    NSLog(@"Gesture X and Y are %f and %f", [sender locationInView:self.view].x, [sender locationInView:self.view].y);
        
    if([sender locationInView:self.view].x<0.5*self.view.frame.size.width)
    {
        if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.38*self.view.frame.size.height) {
            audioString = [[NSBundle mainBundle] pathForResource:@"boca" ofType:@"caf"]; 
            willPlay=YES;
        }
        else if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.5*self.view.frame.size.height){
            audioString = [[NSBundle mainBundle] pathForResource:@"chifl" ofType:@"caf"];
            willPlay=YES;
        }
        else if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.63*self.view.frame.size.height)
        {
            audioString = [[NSBundle mainBundle] pathForResource:@"espirl" ofType:@"caf"];
            willPlay=YES;
        }
        else if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.75*self.view.frame.size.height){
            audioString = [[NSBundle mainBundle] pathForResource:@"frij" ofType:@"caf"];
            willPlay=YES;
        }
    }
    else {
        if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height&&[sender locationInView:self.view].y<0.38*self.view.frame.size.height) {
            audioString = [[NSBundle mainBundle] pathForResource:@"patito" ofType:@"caf"]; 
            willPlay=YES;
        }
        else if  ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.5*self.view.frame.size.height) {
            audioString = [[NSBundle mainBundle] pathForResource:@"silbat" ofType:@"caf"]; 
            willPlay=YES;
        }
        else if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.63*self.view.frame.size.height){
            audioString = [[NSBundle mainBundle] pathForResource:@"vaso" ofType:@"caf"]; 
            willPlay=YES;
        }
        else if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.75*self.view.frame.size.height){
            audioString = [[NSBundle mainBundle] pathForResource:@"chifl2" ofType:@"caf"]; 
            willPlay=YES;
        }
    }
        
    if(willPlay)
    {
        NSString* expandedPath = [audioString stringByExpandingTildeInPath];
        NSURL* audioUrl = [NSURL fileURLWithPath:expandedPath];
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"])
        {
            self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:nil];
            [player2 setDelegate:self];
            [self.player2 play];
        }
    }
    
}

-(IBAction)playAnimalNoise:(id)sender{
    NSString *audioString;
    switch (chosenAnimal) {
        case 1: audioString = [[NSBundle mainBundle] pathForResource:@"cht" ofType:@"caf"]; break;
        case 2: audioString = [[NSBundle mainBundle] pathForResource:@"rawr" ofType:@"caf"]; break;
        case 3: audioString = [[NSBundle mainBundle] pathForResource:@"bzz" ofType:@"caf"];break;
        case 4: audioString = [[NSBundle mainBundle] pathForResource:@"cruac" ofType:@"caf"];break;
        case 5: audioString = [[NSBundle mainBundle] pathForResource:@"gloo" ofType:@"caf"];break;
        case 6: audioString = [[NSBundle mainBundle] pathForResource:@"sss" ofType:@"caf"];break;
        case 7: audioString = [[NSBundle mainBundle] pathForResource:@"oink" ofType:@"caf"];break;
        case 8: audioString = [[NSBundle mainBundle] pathForResource:@"toobrt" ofType:@"caf"]; break;
        case 9: audioString = [[NSBundle mainBundle] pathForResource:@"tweet" ofType:@"caf"]; break;
        case 10: audioString = [[NSBundle mainBundle] pathForResource:@"flipflap" ofType:@"caf"];break;
        case 11: audioString = [[NSBundle mainBundle] pathForResource:@"baaa" ofType:@"caf"]; break;
        case 12: audioString = [[NSBundle mainBundle] pathForResource:@"moo" ofType:@"caf"];break;
        case 13: audioString = [[NSBundle mainBundle] pathForResource:@"meow" ofType:@"caf"];break;
        case 14: audioString = [[NSBundle mainBundle] pathForResource:@"raf" ofType:@"caf"];break;
        default:audioString = [[NSBundle mainBundle] pathForResource:@"mmhhaaaa" ofType:@"caf"];break;
    }
    
    
        
    NSString* expandedPath = [audioString stringByExpandingTildeInPath];
    NSURL* audioUrl = [NSURL fileURLWithPath:expandedPath];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"])
    {
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:nil];
        [player2 setDelegate:self];
        [self.player2 play];
    }
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    NSLog(@"AnimalVC:gestureRecog should RecieveTouch");
    if ((touch.view == self.replayButton||touch.view == self.goAnimalsButton||touch.view == self.goToColorsButton||touch.view == self.muteButton||touch.view == self.beButton||touch.view==self.goBackButton||touch.view==self.rawrButt)) {//change it to your condition
        return NO;
    }
    return YES;
}

-(IBAction)playAudio:(id)sender{

    ColorPicker *cp=[[ColorPicker alloc] init];
    
    const CGFloat* components = CGColorGetComponents(thaColor.CGColor);
    NSString *lclColorString=[cp colorNameFromRed:components[0] Green:components[1] Blue:components[2] Pos:[self.sliVal floatValue]];
    
    NSString *audioString;
    switch (chosenAnimal) {
        case 1: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"ladybug"]] ofType:@"caf"]; break;
        case 2: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"lion"]] ofType:@"caf"]; break;
        case 3: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"bee"]] ofType:@"caf"]; break;
        case 4: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"frog"]] ofType:@"caf"]; break;
        case 5: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"fish"]] ofType:@"caf"]; break;
        case 6: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"snake"]] ofType:@"caf"]; break;
        case 7: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"pig"]] ofType:@"caf"]; break;
        case 8: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"elephant"]] ofType:@"caf"]; break;
        case 9: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"flamingo"]] ofType:@"caf"]; break;
        case 10: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"butterfly"]] ofType:@"caf"]; break;
        case 11: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"sheep"]] ofType:@"caf"]; break;
        case 12: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"cow"]] ofType:@"caf"]; break;
        case 13: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"cat"]] ofType:@"caf"]; break;
        case 14: audioString = [[NSBundle mainBundle] pathForResource:[@"c" stringByAppendingString:[lclColorString stringByAppendingString:@"dog"]] ofType:@"caf"]; break;
        default:audioString = [[NSBundle mainBundle] pathForResource:@"crainbowstarfish" ofType:@"caf"]; break;
    }
    NSString *flurryAnimalString=[audioString stringByReplacingOccurrencesOfString:@".caf" withString:@"On The See Screen"];
    [FlurryAnalytics logEvent:flurryAnimalString];

    
        
    NSString* expandedPath = [audioString stringByExpandingTildeInPath];
    NSURL* audioUrl = [NSURL fileURLWithPath:expandedPath];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"])
    {
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:nil];
        [player setDelegate:self];
        [self.player play];
    }

} 


-(IBAction)goColors:(id)sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    [self playAudio:nil];
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)aPlayer successfully:(BOOL)playedSuccessfully {
    
    if(aPlayer==self.player)
    {
        self.player = nil;
    }
    if(aPlayer==self.player2)
    {
        self.player2 = nil;
    }
}

- (void)viewDidUnload
{
    NSLog(@"ViewController:viewDidLoad");
    [super viewDidUnload];
    
}

@end
