//
//  AnimalPickerViewController.m
//  HappySachi
//
//  Created by Ben Boral on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnimalPickerViewController.h"
#import "FlurryAnalytics.h"


@interface AnimalPickerViewController ()

@end

@implementation AnimalPickerViewController
@synthesize selectedColor;
@synthesize bgImg, goBackAumImg, goBackAumButton, goBackColorsImg, goBackColorsButton;
@synthesize chosenAnimal, buttonArray;
@synthesize blownUpAnimal;
@synthesize smallAnimalLocs;
@synthesize seeButton;
@synthesize muteImg, muteButton;
@synthesize selectedColorString;
@synthesize player;
@synthesize sliVal;


-(void)setUpSharedStuff{
    NSLog(@"AumViewController:SetUpSharedStuff");
    
    
    self.view.backgroundColor=selectedColor;
    blownUpAnimal=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"transparentTrack.png"]];
    
    self.chosenAnimal=0;

    [FlurryAnalytics logEvent:@"OnAnimalSelectionPage"];
    
    //Creating the button to go back a screen
    goBackColorsImg=[UIImage imageNamed:@"goBackColor.png"];
    goBackColorsButton=[UIButton buttonWithType:UIButtonTypeCustom];
    goBackColorsButton.frame=CGRectMake(0, self.goBackColorsImg.size.height  , self.goBackColorsImg.size.width, self.goBackColorsImg.size.height);
    [goBackColorsButton setBackgroundImage:goBackColorsImg forState:UIControlStateNormal];
    [goBackColorsButton addTarget:self.navigationController action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    //goBackColorsButton.autoresizingMask=UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:goBackColorsButton];
    
    
    
    UIButton *b1=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b2=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b3=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b4=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b5=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b6=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b7=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b8=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b9=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b10=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b11=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b12=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b13=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b14=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b15=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b16=[UIButton buttonWithType:UIButtonTypeCustom];

    self.buttonArray=[[NSArray alloc] initWithObjects:b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, nil];
    UIImageView *butImgV=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BackToAum.png"]];
    NSMutableString *name=(NSMutableString*)@"BackToAum";
    
    for(int i=0; i<16; i++)
    {
        switch (i) {
            case 0:
                name=(NSMutableString*)@"BackToAum.png";
                break;
            case 1:
                name=(NSMutableString*)@"Ladybug.png";
                break;
            case 2:
                name=(NSMutableString*)@"Lion.png";
                break;
            case 3:
                name=(NSMutableString*)@"Bee.png";
                break;
            case 4:
                name=(NSMutableString*)@"Frog.png";
                break;
            case 5:
                name=(NSMutableString*)@"Fish.png";
                break;
            case 6:
                name=(NSMutableString*)@"Snake.png";
                break;
            case 7:
                name=(NSMutableString*)@"Pig.png";
                break;
            case 8:
                name=(NSMutableString*)@"Elephant.png";
                break;
            case 9:
                name=(NSMutableString*)@"Flamingo.png";
                break;
            case 10:
                name=(NSMutableString*)@"Butterfly.png";
                break;
            case 11:
                name=(NSMutableString*)@"Sheep.png";
                break;
            case 12:
                name=(NSMutableString*)@"Cow.png";
                break;
            case 13:
                name=(NSMutableString*)@"Cat.png";
                break;
            case 14:
                name=(NSMutableString*)@"Dog.png";
                break;
            default:
                name=(NSMutableString*)@"StarFish.png";
                break;
        }
        
        butImgV.image=[UIImage imageNamed:name];
        [[self.buttonArray objectAtIndex:i]setBackgroundImage:butImgV.image forState:UIControlStateNormal];
        [((UIButton*)[self.buttonArray objectAtIndex:i]) setFrame:CGRectMake([[self.smallAnimalLocs objectAtIndex:i] CGPointValue].x, [[self.smallAnimalLocs objectAtIndex:i] CGPointValue].y, butImgV.image.size.width, butImgV.image.size.height)];
              
        
        [[self.buttonArray objectAtIndex:i]setTag:i];
        
        if(i>0&&i<15)
        {
            [[self.buttonArray objectAtIndex:i] addTarget:self action:@selector(showBig:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if(i==0)
        {
            [[self.buttonArray objectAtIndex:i] addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
        }
        else{
            [[self.buttonArray objectAtIndex:i] addTarget:self action:@selector(goToRelax:) forControlEvents:UIControlEventTouchUpInside];
            [[self.buttonArray objectAtIndex:i] addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [self.view addSubview:[self.buttonArray objectAtIndex:i]];
    }
    
}



-(void)viewDidDisappear:(BOOL)animated{
    [blownUpAnimal removeFromSuperview];
    [seeButton removeFromSuperview];
    
    for(UITapGestureRecognizer *tap in self.view.gestureRecognizers)
    {
        [self.view removeGestureRecognizer:tap];
    }
    
}

-(IBAction)goToRelax:(UIButton *)sender{
    NSLog(@"AnimalPicker:goToRelax");
    self.chosenAnimal=15;
}

-(IBAction)showBig:(UIButton *)sender
{
    
    NSLog(@"AnimalPickerViewController: showBig");
    NSLog(@"senderChosen is %d", sender.tag);
    self.chosenAnimal=sender.tag;
    
    NSString* audioString;

    
    switch (sender.tag) 
    {
        case 1:
            blownUpAnimal.image=[UIImage imageNamed:@"BigLadybug.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"ladybug" ofType:@"caf"];
            break;
        case 2:
            blownUpAnimal.image=[UIImage imageNamed:@"BigLion.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"lion" ofType:@"caf"];
            break;
        case 3:
            blownUpAnimal.image=[UIImage imageNamed:@"BigBee.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"bee" ofType:@"caf"];
            break;
        case 4:
            blownUpAnimal.image=[UIImage imageNamed:@"BigFrog.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"frog" ofType:@"caf"];
            break;
        case 5:
            blownUpAnimal.image=[UIImage imageNamed:@"BigFish.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"fish" ofType:@"caf"];
            break;
        case 6:
            blownUpAnimal.image=[UIImage imageNamed:@"BigSnake.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"snake" ofType:@"caf"];
            break;
        case 7:
            blownUpAnimal.image=[UIImage imageNamed:@"BigPig.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"pig" ofType:@"caf"];
            break;
        case 8:
            blownUpAnimal.image=[UIImage imageNamed:@"BigElephant.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"elephant" ofType:@"caf"];
            break;
        case 9:
            blownUpAnimal.image=[UIImage imageNamed:@"BigFlamingo.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"flamingo" ofType:@"caf"];
            break;
        case 10:
            blownUpAnimal.image=[UIImage imageNamed:@"BigButterfly.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"butterfly" ofType:@"caf"];
            break;
        case 11:
            blownUpAnimal.image=[UIImage imageNamed:@"BigSheep.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"sheep" ofType:@"caf"];
            break;
        case 12:
            blownUpAnimal.image=[UIImage imageNamed:@"BigCow.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"cow" ofType:@"caf"];
            break;
        case 13:
            blownUpAnimal.image=[UIImage imageNamed:@"BigCat.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"caf"];
            break;
        default:
            blownUpAnimal.image=[UIImage imageNamed:@"BigDog.png"];
            audioString = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"caf"];
            break;
    }
    
    NSString* expandedPath = [audioString stringByExpandingTildeInPath];
    NSURL* audioUrl = [NSURL fileURLWithPath:expandedPath];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"])
    {
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:nil];
        [player setDelegate:self];
        [self.player play];
    }
    
    [blownUpAnimal setContentMode:UIViewContentModeCenter];
    [blownUpAnimal setContentMode:UIViewContentModeScaleAspectFit];
    [blownUpAnimal setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y, sender.frame.size.width, sender.frame.size.height)];
    [self.view addSubview:blownUpAnimal];
     NSLog(@"zzz %f", self.view.frame.size.width);
    [UIView animateWithDuration:2.0f
                          delay:0.0f
                        options:UIViewAnimationOptionTransitionCrossDissolve
                     animations:^(void) {
                         blownUpAnimal.frame=CGRectMake(0, (self.view.frame.size.height-blownUpAnimal.image.size.height)/2.0, self.view.frame.size.width, blownUpAnimal.image.size.height);
                     }
                     completion:NULL];
    blownUpAnimal.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *oneFingerOneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playRoar:)];
    oneFingerOneTap.delegate=self;
    [oneFingerOneTap setNumberOfTapsRequired:1];
    [oneFingerOneTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:oneFingerOneTap];
    
    seeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [seeButton setTag:17];
    UIImage *seeImage=[UIImage imageNamed:@"See.png"];
    [self.seeButton setBackgroundImage:seeImage forState:UIControlStateNormal];
    self.seeButton.frame=CGRectMake(blownUpAnimal.frame.size.width-seeImage.size.width, blownUpAnimal.frame.size.height-seeImage.size.height, seeImage.size.width, seeImage.size.height);
    [self.seeButton addTarget:delegate action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    [blownUpAnimal addSubview:seeButton];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    NSLog(@"AnimalVC:gestureRecog should RecieveTouch");
    if ((touch.view == self.seeButton)) {//change it to your condition
        return NO;
    }
    return YES;
}

-(IBAction)getRid:(id)sender
{
    
    [UIImageView animateWithDuration:1 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
            blownUpAnimal.alpha=0;}
                              completion:^(BOOL finished){
                                  [blownUpAnimal removeFromSuperview];
                                  [blownUpAnimal.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                  blownUpAnimal.alpha=1;
                              }];
    
    
}

-(IBAction)playRoar:(UITapGestureRecognizer *)sender{
   
    if ([sender locationInView:self.view].x<0.25*self.view.frame.size.width||[sender locationInView:self.view].x>0.75*self.view.frame.size.width||[sender locationInView:self.view].y>0.75*self.view.frame.size.height||
        [sender locationInView:self.view].y<0.25*self.view.frame.size.height) {
        [self.view removeGestureRecognizer:sender];
        [self getRid:sender];
        
        
    }
    else {
        
        NSString* audioString;
        switch (self.chosenAnimal) 
        {
            case 1:audioString = [[NSBundle mainBundle] pathForResource:@"cht" ofType:@"caf"];break;
            case 2:audioString = [[NSBundle mainBundle] pathForResource:@"rawr" ofType:@"caf"];break;
            case 3:audioString = [[NSBundle mainBundle] pathForResource:@"bzz" ofType:@"caf"];break;
            case 4:audioString = [[NSBundle mainBundle] pathForResource:@"cruac" ofType:@"caf"];break;
            case 5:audioString = [[NSBundle mainBundle] pathForResource:@"gloo" ofType:@"caf"];break;
            case 6:audioString = [[NSBundle mainBundle] pathForResource:@"sss"  ofType:@"caf"];break;
            case 7:audioString = [[NSBundle mainBundle] pathForResource:@"oink" ofType:@"caf"];break;
            case 8:audioString = [[NSBundle mainBundle] pathForResource:@"toobrt" ofType:@"caf"];break;
            case 9:audioString = [[NSBundle mainBundle] pathForResource:@"tweet" ofType:@"caf"];break;
            case 10:audioString = [[NSBundle mainBundle] pathForResource:@"flipflap" ofType:@"caf"];break;
            case 11:audioString = [[NSBundle mainBundle] pathForResource:@"baaa" ofType:@"caf"];break;
            case 12:audioString = [[NSBundle mainBundle] pathForResource:@"moo" ofType:@"caf"];break;
            case 13:audioString = [[NSBundle mainBundle] pathForResource:@"meow" ofType:@"caf"];break;
            default:audioString = [[NSBundle mainBundle] pathForResource:@"raf" ofType:@"caf"];break;
            }
        

        NSString* expandedPath = [audioString stringByExpandingTildeInPath];
        NSURL* audioUrl = [NSURL fileURLWithPath:expandedPath];
        
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"])
        {
            self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:nil];
            [player setDelegate:self];
            [self.player play];
        }
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)playedSuccessfully {
    self.player = nil;
}

- (void)viewDidUnload
{
    NSLog(@"ViewController:viewDidLoad");
    [super viewDidUnload];
    
}




@end
