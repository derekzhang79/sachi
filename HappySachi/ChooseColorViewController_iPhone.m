//
//  ChooseColorViewController_iPhone.m
//  HappySachi
//
//  Created by Ben Boral on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChooseColorViewController_iPhone.h"

@interface ChooseColorViewController_iPhone ()

@end

@implementation ChooseColorViewController_iPhone
@synthesize anotherPlayer;
- (void)viewDidLoad
{
    NSLog(@"ChooseColorViewControlleriPhone:viewDidLoad");
    [super viewDidLoad];
    
    cp=[[ColorPicker alloc] init];
    
    //Setting background img
    bgImg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    [bgImg setImage:[UIImage imageNamed:@"ChooseColor.png"]];
    [self.view addSubview:bgImg];
    [self.view sendSubviewToBack:bgImg];
    [self setUpSharedStuff];
    
    [self.goToAnimalsButton addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(IBAction)nextPage:(UIButton *)sender{
    NSLog(@"ChooseColoriPhone:nextPage");
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"]){
        [self performSegueWithIdentifier:@"ToAnimalPicker" sender:sender];
    }
    else {
        
        float correctedVal=self.slider.value;
        if(correctedVal>0.98){
            correctedVal=0.98;
        }
        
        const CGFloat* components = CGColorGetComponents([self pixelInfo:correctedVal fromImage:self.bgImg.image].CGColor);
       
        NSString* audioString=[[NSBundle mainBundle] pathForResource:[cp colorNameFromRed:components[0] Green:components[1] Blue:components[2] Pos:self.slider.value] ofType:@"caf"];
            self.selectedColorString=(NSMutableString*)[cp colorNameFromRed:components[0] Green:components[1] Blue:components[2] Pos:self.slider.value];
  
        
        
        
        NSString* expandedPath = [audioString stringByExpandingTildeInPath];
        NSURL* audioUrl = [NSURL fileURLWithPath:expandedPath];
        
        self.anotherPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:nil];
        [anotherPlayer setDelegate:self];
        [self.anotherPlayer play];
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)playedSuccessfully {
    self.player = nil;
    if(player==anotherPlayer)
    {
        [self performSegueWithIdentifier:@"ToAnimalPicker" sender:nil];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"ChooseColorViewController_iPad:prepareForSegue");
    
    //Send the selected color to the next view
    if([[segue identifier] isEqualToString:@"ToAnimalPicker"]){
        AnimalPickerViewController_iPhone *vc = [segue destinationViewController];
        float sliVal=slider.value;
        if(sliVal>0.98)
        {
            sliVal=0.98;
        }
        vc.selectedColor=[self pixelInfo:sliVal fromImage:self.bgImg.image];
        vc.selectedColorString=self.selectedColorString;
        vc.sliVal=[NSNumber numberWithFloat:sliVal];
    }
}


@end
