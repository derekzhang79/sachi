//
//  BeViewController.m
//  HappySachi
//
//  Created by Ben Boral on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BeViewController.h"
#import "FlurryAnalytics.h"

@interface BeViewController ()

@end

@implementation BeViewController

@synthesize chosenAnimal, thaColor;
@synthesize bgImg;
@synthesize goToColorsButton;
@synthesize goColorsImg;
@synthesize goAnimalsImg;
@synthesize goAnimalsButton;
@synthesize replayImg;
@synthesize replayButton;
@synthesize starImg;
@synthesize starButton;
@synthesize muteImg;
@synthesize muteButton;
@synthesize goBackAumButton;
@synthesize goBackAumImg;
@synthesize goBackImg;
@synthesize goBackButt;
@synthesize rawrImg;
@synthesize rawrButt;
@synthesize player;
@synthesize player2;


-(IBAction)goColors:(id)sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
}

-(NSURL *)instructionsAudio{
    NSString *audioString;
    switch (chosenAnimal) {
        case 1: audioString = [[NSBundle mainBundle] pathForResource:@"BeLadybug" ofType:@"caf"]; break;
        case 2: audioString = [[NSBundle mainBundle] pathForResource:@"BeLion" ofType:@"caf"]; break;
        case 3: audioString = [[NSBundle mainBundle] pathForResource:@"BeBee" ofType:@"caf"];break;
        case 4: audioString = [[NSBundle mainBundle] pathForResource:@"BeFrog" ofType:@"caf"];break;
        case 5: audioString = [[NSBundle mainBundle] pathForResource:@"BeFish" ofType:@"caf"];break;
        case 6: audioString = [[NSBundle mainBundle] pathForResource:@"BeSnake" ofType:@"caf"];break;
        case 7: audioString = [[NSBundle mainBundle] pathForResource:@"BePig" ofType:@"caf"];break;
        case 8: audioString = [[NSBundle mainBundle] pathForResource:@"BeElephant" ofType:@"caf"]; break;
        case 9: audioString = [[NSBundle mainBundle] pathForResource:@"BeFlamingo" ofType:@"caf"]; break;
        case 10: audioString = [[NSBundle mainBundle] pathForResource:@"BeButterfly" ofType:@"caf"];break;
        case 11: audioString = [[NSBundle mainBundle] pathForResource:@"BeSheep" ofType:@"caf"]; break;
        case 12: audioString = [[NSBundle mainBundle] pathForResource:@"BeCow" ofType:@"caf"];break;
        case 13: audioString = [[NSBundle mainBundle] pathForResource:@"BeCat" ofType:@"caf"];break;
        case 14: audioString = [[NSBundle mainBundle] pathForResource:@"BeDog" ofType:@"caf"];break;
        default:audioString = [[NSBundle mainBundle] pathForResource:@"BeStarfish" ofType:@"caf"];break;
    }
    NSLog(@"The filepath for the audio file is %@", audioString);
    
    NSString *flurryAnimalString=[audioString stringByReplacingOccurrencesOfString:@".caf" withString:@"On The Be Screen"];
    [FlurryAnalytics logEvent:flurryAnimalString];
    
    return [NSURL fileURLWithPath:audioString];
}

-(void)setUpSharedStuff{
    NSLog(@"SeeViewController:SetUpSharedStuff");
    
    [FlurryAnalytics logEvent:@"Be Screen"];
    
    self.view.backgroundColor=thaColor;
    
            
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"])
    {
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[self instructionsAudio] error:nil];
        [player setDelegate:self];
        [self.player play];
    }
    
    if(chosenAnimal!=15)
    {
    //Creating the button to go to next screen
    starImg=[UIImage imageNamed:@"StarFish.png"];
    starButton=[UIButton buttonWithType:UIButtonTypeCustom];
    starButton.frame=CGRectMake((self.view.frame.size.width-self.starImg.size.width), (self.view.frame.size.height-self.starImg.size.height), self.starImg.size.width, self.starImg.size.height);
    [starButton setBackgroundImage:starImg forState:UIControlStateNormal];
    starButton.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleTopMargin);
    [starButton addTarget:delegate action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:starButton];
    }
    else {
        //Creating the button to go back a screen
        goBackAumImg=[UIImage imageNamed:@"BackToAum.png"];
        goBackAumButton=[UIButton buttonWithType:UIButtonTypeCustom];
        goBackAumButton.frame=CGRectMake((self.view.frame.size.width-self.goBackAumImg.size.width), (self.view.frame.size.height-self.goBackAumImg.size.width) , self.goBackAumImg.size.width, self.goBackAumImg.size.height);
        [goBackAumButton setBackgroundImage:goBackAumImg forState:UIControlStateNormal];
        [goBackAumButton addTarget:self action:@selector(backToAum:) forControlEvents:UIControlEventTouchUpInside];
        goBackAumButton.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleTopMargin);
        [self.view addSubview:goBackAumButton];
    }
    
    muteImg=[[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"] ? [UIImage imageNamed:@"Unmute.png"] : [UIImage imageNamed:@"Mute.png"];    muteButton=[UIButton buttonWithType:UIButtonTypeCustom];
    muteButton.frame=CGRectMake(self.view.frame.size.width-(self.muteImg.size.width), 0 , self.muteImg.size.width, self.muteImg.size.height);
    muteButton.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin);
    [muteButton setBackgroundImage:muteImg forState:UIControlStateNormal];
    [muteButton addTarget:self action:@selector(changeMute:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:muteButton];
    
    //Creating the button to go back to color chooser screen
    goColorsImg=[UIImage imageNamed:@"goBackColor.png"];
    goToColorsButton=[UIButton buttonWithType:UIButtonTypeCustom];
    goToColorsButton.frame=CGRectMake(0, self.goColorsImg.size.height, self.goColorsImg.size.width, self.goColorsImg.size.height);
    [goToColorsButton setBackgroundImage:goColorsImg forState:UIControlStateNormal];
    [goToColorsButton addTarget:self action:@selector(goColors:) forControlEvents:UIControlEventTouchUpInside];
    //goToColorsButton.autoresizingMask=UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:goToColorsButton];
    
    //Creating the button to go back to replay intro audio
    replayImg=[UIImage imageNamed:@"Replay.png"];
    replayButton=[UIButton buttonWithType:UIButtonTypeCustom];
    replayButton.frame=CGRectMake((1.5*self.goColorsImg.size.width), 0 , self.replayImg.size.width, self.replayImg.size.height);
    [replayButton setBackgroundImage:replayImg forState:UIControlStateNormal];
    [replayButton addTarget:self action:@selector(playAudio:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:replayButton];
    
    //Creating the button to go back to animal screen
    goAnimalsImg=[UIImage imageNamed:@"AnimalsImg.png"];
    goAnimalsButton=[UIButton buttonWithType:UIButtonTypeCustom];
    goAnimalsButton.frame=CGRectMake(0, 2*self.goColorsImg.size.height , self.goAnimalsImg.size.width, self.goAnimalsImg.size.height);
    [goAnimalsButton setBackgroundImage:goAnimalsImg forState:UIControlStateNormal];
    //goAnimalsButton.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin);
    [goAnimalsButton addTarget:self action:@selector(backToAn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goAnimalsButton];
    
    goBackImg=[UIImage imageNamed:@"GoBack.png"];
    goBackButt=[UIButton buttonWithType:UIButtonTypeCustom];
    goBackButt.frame=CGRectMake(0, self.view.frame.size.height-self.goBackImg.size.height , self.goBackImg.size.width, self.goBackImg.size.height);
    [goBackButt setBackgroundImage:goBackImg forState:UIControlStateNormal];
    goBackButt.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin);
    [goBackButt addTarget:self.navigationController action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackButt];
    

    
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

-(IBAction)backToAum:(id)sender{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}

-(IBAction)playAudio:(id)sender{
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"])
    {
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[self instructionsAudio] error:nil];
        [player setDelegate:self];
        [self.player play];
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

-(IBAction)backToAn:(id)sender{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:3] animated:YES];
}

-(IBAction)playFX:(UITapGestureRecognizer *)sender{
   
    BOOL willPlay=NO;
    NSString *audioString;
    NSLog(@"Gesture X and Y are %f and %f", [sender locationInView:self.view].x, [sender locationInView:self.view].y);
    
    if(self.chosenAnimal!=15)
    {
        
        if([sender locationInView:self.view].x<0.5*self.view.frame.size.width)
        {
            if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height&&[sender locationInView:self.view].y<0.38*self.view.frame.size.height) 
            {
                audioString = [[NSBundle mainBundle] pathForResource:@"breathe" ofType:@"caf"];
                willPlay=YES;
            }
            else if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.5*self.view.frame.size.height)
            {
                audioString = [[NSBundle mainBundle] pathForResource:@"giggle" ofType:@"caf"]; 
                willPlay=YES;
            }
            else if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.63*self.view.frame.size.height)
            {
                audioString = [[NSBundle mainBundle] pathForResource:@"happy" ofType:@"caf"]; 
                willPlay=YES;
            }
            else if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.75*self.view.frame.size.height)
            {
                audioString = [[NSBundle mainBundle] pathForResource:@"Kisss" ofType:@"caf"]; 
                willPlay=YES;
            }
        }
        else {
            if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height&&[sender locationInView:self.view].y<0.38*self.view.frame.size.height) {
                audioString = [[NSBundle mainBundle] pathForResource:@"breathe" ofType:@"caf"]; 
                willPlay=YES;
            }
            else if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.5*self.view.frame.size.height) {
                audioString = [[NSBundle mainBundle] pathForResource:@"imagine" ofType:@"caf"]; 
                willPlay=YES;
            }
            else if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.63*self.view.frame.size.height){
                audioString = [[NSBundle mainBundle] pathForResource:@"relax" ofType:@"caf"]; 
                willPlay=YES;
            }
            else if ([sender locationInView:self.view].y>0.25*self.view.frame.size.height && [sender locationInView:self.view].y<0.75*self.view.frame.size.height){
                audioString = [[NSBundle mainBundle] pathForResource:@"smile" ofType:@"caf"]; 
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
    else if(self.chosenAnimal==15)
    {
        NSString *audioString;
        NSLog(@"Gesture X and Y are %f and %f", [sender locationInView:self.view].x, [sender locationInView:self.view].y);
        if([sender locationInView:self.view].x<0.5*self.view.frame.size.width)
        {
            if ([sender locationInView:self.view].y<0.25*self.view.frame.size.height) 
            {
                audioString = [[NSBundle mainBundle] pathForResource:@"Relaxhead" ofType:@"caf"]; 
            }
            else if ([sender locationInView:self.view].y<0.5*self.view.frame.size.height)
            {
                audioString = [[NSBundle mainBundle] pathForResource:@"Relaxchest" ofType:@"caf"]; 
            }
            else if ([sender locationInView:self.view].y<0.75*self.view.frame.size.height)
            {
                audioString = [[NSBundle mainBundle] pathForResource:@"Relaxtummy" ofType:@"caf"]; 
            }
            else
            {
                audioString = [[NSBundle mainBundle] pathForResource:@"Relaxlegs" ofType:@"caf"]; 
            }
        }
        else {
            if ([sender locationInView:self.view].y<0.25*self.view.frame.size.height) {
                audioString = [[NSBundle mainBundle] pathForResource:@"Relaxneck" ofType:@"caf"]; 
            }
            else if ([sender locationInView:self.view].y<0.5*self.view.frame.size.height) {
                audioString = [[NSBundle mainBundle] pathForResource:@"Relaxheart" ofType:@"caf"]; 
            }
            else if ([sender locationInView:self.view].y<0.75*self.view.frame.size.height){
                audioString = [[NSBundle mainBundle] pathForResource:@"Relaxarms" ofType:@"caf"]; 
            }
            else {
                audioString = [[NSBundle mainBundle] pathForResource:@"Relaxfeet" ofType:@"caf"]; 
            }
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
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    NSLog(@"AnimalVC:gestureRecog should RecieveTouch");
    if (touch.view == self.goAnimalsButton||touch.view == self.goToColorsButton||touch.view == self.muteButton||touch.view == self.starButton||touch.view==self.goBackAumButton||touch.view==self.goBackButt||touch.view==self.rawrButt||touch.view==self.replayButton) {//change it to your condition
        return NO;
    }
    return YES;
}

-(IBAction)changeMute:(UIButton *)sender{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"]){
        NSLog(@"Unmute");
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"Mute"];
        [muteButton setBackgroundImage:[UIImage imageNamed:@"Mute.png"] forState:UIControlStateNormal];
        muteButton.frame=CGRectMake(self.view.frame.size.width-[UIImage imageNamed:@"Unmute.png"].size.width, 0 , [UIImage imageNamed:@"Unmute.png"].size.width, [UIImage imageNamed:@"Unmute.png"].size.height);
    }
    else {
        NSLog(@"Mute");
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Mute"];
        [muteButton setBackgroundImage:[UIImage imageNamed:@"Unmute.png"] forState:UIControlStateNormal];
        muteButton.frame=CGRectMake(self.view.frame.size.width-(self.muteImg.size.width), 0 , self.muteImg.size.width, self.muteImg.size.height);
        [self.player stop];
        [self.player2 stop];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
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

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.player2 stop];
    [self.player stop];
}

- (void)viewDidUnload
{
    NSLog(@"ViewController:viewDidLoad");
    [super viewDidUnload];
    
}

@end