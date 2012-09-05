//
//  ChooseColorViewController_iPad.m
//  HappySachi
//
//  Created by Ben Boral on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChooseColorViewController_iPad.h"

@interface ChooseColorViewController_iPad ()

@end

@implementation ChooseColorViewController_iPad

@synthesize anotherPlayer;

- (void)viewDidLoad
{
    
    
    NSLog(@"ChooseColorViewControlleriPAD:viewDidLoad");
    [super viewDidLoad];
    
    cp=[[ColorPicker alloc] init];
    
    //loads background image based on orientation
    bgImg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"ChooseColor-Landscape.png"] : [UIImage imageNamed:@"ChooseColor-Portrait.png"];
    [self.view addSubview:bgImg];
    [self.view sendSubviewToBack:bgImg];
    [self setUpSharedStuff];
    [self.goToAnimalsButton addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)viewWillAppear:(BOOL)animated{
    //Setting background img based on orientation
    bgImg.frame=self.view.bounds;
    bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"ChooseColor-Landscape.png"] : [UIImage imageNamed:@"ChooseColor-Portrait.png"];    
    
    slider.frame=CGRectMake(-0.5*(self.sliderThumbImg.size.width), self.view.center.y, self.view.frame.size.width+(self.sliderThumbImg.size.width), 20);
    if(slider.value<0.01){
                          
    whatColor.frame = CGRectMake(-0.5*[UIImage imageNamed:@"ColorButton.png"].size.width, 0.5*self.view.frame.size.height-0.5*self.sliderThumbImg.size.height-[UIImage imageNamed:@"ColorButton.png"].size.height,[UIImage imageNamed:@"ColorButton.png"].size.width,[UIImage imageNamed:@"ColorButton.png"].size.height);
    }
    else {
        whatColor.frame = CGRectMake(slider.value*self.view.frame.size.width-0.5*whatColor.frame.size.width, 0.5*self.view.frame.size.height-0.5*self.sliderThumbImg.size.height-[UIImage imageNamed:@"ColorButton.png"].size.height,[UIImage imageNamed:@"ColorButton.png"].size.width,[UIImage imageNamed:@"ColorButton.png"].size.height);
    }
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;    
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"AumViewControlleriPad:willAutorotateToInterfaceOrientation");
    
    //Toggles between landscape and portrait versions of background image
    bgImg.frame=self.view.bounds;
    bgImg.image = UIInterfaceOrientationIsLandscape(toInterfaceOrientation) ? [UIImage imageNamed:@"ChooseColor-Landscape.png"] : [UIImage imageNamed:@"ChooseColor-Portrait.png"];
    
    slider.frame=CGRectMake(-0.5*(self.sliderThumbImg.size.width), self.view.center.y, self.view.frame.size.width+(self.sliderThumbImg.size.width), 20);
    
    whatColor.frame = CGRectMake(slider.value*self.view.frame.size.width-0.5*whatColor.frame.size.width, self.view.frame.size.height*0.5-0.5*self.sliderThumbImg.size.height-whatColor.frame.size.height, [UIImage imageNamed:@"ColorButton.png"].size.width, [UIImage imageNamed:@"ColorButton.png"].size.height);

}

-(IBAction)nextPage:(UIButton *)sender{
    NSLog(@"ChooseColorVCIpad:nextPage:");
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
        AnimalPickerViewController_iPad *vc = [segue destinationViewController];
        float sliVal=slider.value;
        if(sliVal>0.98)
        {
            sliVal=0.98;
        }
        vc.selectedColor=[self pixelInfo:sliVal fromImage:self.bgImg.image];
        NSLog(@"ChooseColor perepareForSegua: sel.fselectedcolor is %@", self.selectedColorString);
        vc.selectedColorString=self.selectedColorString;
        vc.sliVal=[NSNumber numberWithFloat:sliVal];
    }
}

@end
