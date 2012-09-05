//
//  SeeViewController_iPad.m
//  HappySachi
//
//  Created by Ben Boral on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SeeViewController_iPad.h"

@interface SeeViewController_iPad ()

@end

@implementation SeeViewController_iPad
@synthesize anotherPlayer;
- (void)viewDidLoad
{
    NSLog(@"SeeViewControllerIPAD:viewDidLoad");
    [super viewDidLoad];

    //load background image based on orientation
    bgImg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    switch(chosenAnimal)
    {
        case 1:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineLadybug-Landscape.png"] : [UIImage imageNamed:@"OutlineLadybug-Portrait.png"];
            break;
        case 2:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineLion-Landscape.png"] : [UIImage imageNamed:@"OutlineLion-Portrait.png"];
            break;
        case 3:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineBee-Landscape.png"] : [UIImage imageNamed:@"OutlineBee-Portrait.png"];
            break;
        case 4:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineFrog-Landscape.png"] : [UIImage imageNamed:@"OutlineFrog-Portrait.png"];
            break;
        case 5:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineFish-Landscape.png"] : [UIImage imageNamed:@"OutlineFish-Portrait.png"];
            break;
        case 6:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineSnake-Landscape.png"] : [UIImage imageNamed:@"OutlineSnake-Portrait.png"];
            break;
        case 7:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlinePig-Landscape.png"] : [UIImage imageNamed:@"OutlinePig-Portrait.png"];
            break;
        case 8:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineElephant-Landscape.png"] : [UIImage imageNamed:@"OutlineElephant-Portrait.png"];
            break;
        case 9:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineFlamingo-Landscape.png"] : [UIImage imageNamed:@"OutlineFlamingo-Portrait.png"];
            break;
        case 10:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineButterfly-Landscape.png"] : [UIImage imageNamed:@"OutlineButterfly-Portrait.png"];
            break;
        case 11:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineSheep-Landscape.png"] : [UIImage imageNamed:@"OutlineSheep-Portrait.png"];
            break;
        case 12:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineCow-Landscape.png"] : [UIImage imageNamed:@"OutlineCow-Portrait.png"];
            break;
        case 13:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineCat-Landscape.png"] : [UIImage imageNamed:@"OutlineCat-Portrait.png"];
            break;
        case 14:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineDog-Landscape.png"] : [UIImage imageNamed:@"OutlineDog-Portrait.png"];
            break;

        default:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"Relax-Landscape.png"] : [UIImage imageNamed:@"Relax-Portrait.png"];
            break;
    }
    
    
    [self.view addSubview:bgImg];
    [self.view sendSubviewToBack:bgImg];
    [self setUpSharedStuff];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    //Setting background img based on orientation
    bgImg.frame=self.view.bounds;
    switch(chosenAnimal)
    {
        case 1:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineLadybug-Landscape.png"] : [UIImage imageNamed:@"OutlineLadybug-Portrait.png"];
            break;
        case 2:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineLion-Landscape.png"] : [UIImage imageNamed:@"OutlineLion-Portrait.png"];
            break;
        case 3:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineBee-Landscape.png"] : [UIImage imageNamed:@"OutlineBee-Portrait.png"];
            break;
        case 4:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineFrog-Landscape.png"] : [UIImage imageNamed:@"OutlineFrog-Portrait.png"];
            break;
        case 5:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineFish-Landscape.png"] : [UIImage imageNamed:@"OutlineFish-Portrait.png"];
            break;
        case 6:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineSnake-Landscape.png"] : [UIImage imageNamed:@"OutlineSnake-Portrait.png"];
            break;
        case 7:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlinePig-Landscape.png"] : [UIImage imageNamed:@"OutlinePig-Portrait.png"];
            break;
        case 8:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineElephant-Landscape.png"] : [UIImage imageNamed:@"OutlineElephant-Portrait.png"];
            break;
        case 9:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineFlamingo-Landscape.png"] : [UIImage imageNamed:@"OutlineFlamingo-Portrait.png"];
            break;
        case 10:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineButterfly-Landscape.png"] : [UIImage imageNamed:@"OutlineButterfly-Portrait.png"];
            break;
        case 11:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineSheep-Landscape.png"] : [UIImage imageNamed:@"OutlineSheep-Portrait.png"];
            break;
        case 12:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineCow-Landscape.png"] : [UIImage imageNamed:@"OutlineCow-Portrait.png"];
            break;
        case 13:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineCat-Landscape.png"] : [UIImage imageNamed:@"OutlineCat-Portrait.png"];
            break;
        case 14:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineDog-Landscape.png"] : [UIImage imageNamed:@"OutlineDog-Portrait.png"];
            break;
        case 15:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"Relax-Landscape.png"] : [UIImage imageNamed:@"Relax-Portrait.png"];
            break;
        default:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"Relax-Landscape.png"] : [UIImage imageNamed:@"Relax-Portrait.png"];
            break;
    }
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;    
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    NSLog(@"SeeViewControlleriPad:willAutorotateToInterfaceOrientation");
    
    //Toggles between landscape and portrait versions of background image
    bgImg.frame=self.view.bounds;
    switch(chosenAnimal)
    {
        case 1:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineLadybug-Landscape.png"] : [UIImage imageNamed:@"OutlineLadybug-Portrait.png"];
            break;
        case 2:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineLion-Landscape.png"] : [UIImage imageNamed:@"OutlineLion-Portrait.png"];
            break;
        case 3:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineBee-Landscape.png"] : [UIImage imageNamed:@"OutlineBee-Portrait.png"];
            break;
        case 4:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineFrog-Landscape.png"] : [UIImage imageNamed:@"OutlineFrog-Portrait.png"];
            break;
        case 5:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineFish-Landscape.png"] : [UIImage imageNamed:@"OutlineFish-Portrait.png"];
            break;
        case 6:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineSnake-Landscape.png"] : [UIImage imageNamed:@"OutlineSnake-Portrait.png"];
            break;
        case 7:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlinePig-Landscape.png"] : [UIImage imageNamed:@"OutlinePig-Portrait.png"];
            break;
        case 8:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineElephant-Landscape.png"] : [UIImage imageNamed:@"OutlineElephant-Portrait.png"];
            break;
        case 9:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineFlamingo-Landscape.png"] : [UIImage imageNamed:@"OutlineFlamingo-Portrait.png"];
            break;
        case 10:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineButterfly-Landscape.png"] : [UIImage imageNamed:@"OutlineButterfly-Portrait.png"];
            break;
        case 11:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineSheep-Landscape.png"] : [UIImage imageNamed:@"OutlineSheep-Portrait.png"];
            break;
        case 12:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineCow-Landscape.png"] : [UIImage imageNamed:@"OutlineCow-Portrait.png"];
            break;
        case 13:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineCat-Landscape.png"] : [UIImage imageNamed:@"OutlineCat-Portrait.png"];
            break;
        case 14:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"OutlineDog-Landscape.png"] : [UIImage imageNamed:@"OutlineDog-Portrait.png"];
            break;
        case 15:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"Relax-Landscape.png"] : [UIImage imageNamed:@"Relax-Portrait.png"];
            break;
        default:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"Relax-Landscape.png"] : [UIImage imageNamed:@"Relax-Portrait.png"];
            break;
    }
}

-(IBAction)nextPage:(UIButton *)sender{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"])
    {
    [self performSegueWithIdentifier:@"ToBeReal" sender:sender];
    }
    else {
        NSString *audioString = [[NSBundle mainBundle] pathForResource:@"aumAnimal" ofType:@"caf"];
        NSLog(@"audioString is %@", audioString);
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
        [self performSegueWithIdentifier:@"ToBeReal" sender:nil];
    }
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
        [self.anotherPlayer stop];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
} 

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"ChooseColorViewController_iPad:prepareForSegue");
    BeViewController_iPad *be=[segue destinationViewController];
    be.chosenAnimal=self.chosenAnimal;
    be.thaColor=self.thaColor;
    //Send the selected color to the next view
    
    
}

@end
