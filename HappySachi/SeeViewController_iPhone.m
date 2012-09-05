//
//  SeeViewController_iPhone.m
//  HappySachi
//
//  Created by Ben Boral on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SeeViewController_iPhone.h"

@interface SeeViewController_iPhone ()
@end

@implementation SeeViewController_iPhone
@synthesize anotherPlayer;

- (void)viewDidLoad
{
    NSLog(@"SeeViewControlleriPhone:viewDidLoad");
    [super viewDidLoad];
    //Setting background img
    bgImg=[[UIImageView alloc] initWithFrame:self.view.bounds];

    [self setUpSharedStuff];
    
        switch(chosenAnimal)
    {
        case 1:bgImg.image = [UIImage imageNamed:@"OutlineLadybug.png"];
            break;
        case 2:bgImg.image = [UIImage imageNamed:@"OutlineLion.png"];
            break;
        case 3:bgImg.image = [UIImage imageNamed:@"OutlineBee.png"];
            break;
        case 4:bgImg.image = [UIImage imageNamed:@"OutlineFrog.png"];
            break;
        case 5:bgImg.image = [UIImage imageNamed:@"OutlineFish.png"];
            break;
        case 6:bgImg.image = [UIImage imageNamed:@"OutlineSnake.png"];
            break;
        case 7:bgImg.image = [UIImage imageNamed:@"OutlinePig.png"];
            break;
        case 8:bgImg.image = [UIImage imageNamed:@"OutlineElephant.png"];
            break;
        case 9:bgImg.image = [UIImage imageNamed:@"OutlineFlamingo.png"];
            break;
        case 10:bgImg.image =[UIImage imageNamed:@"OutlineButterfly.png"];
            break;
        case 11:bgImg.image =[UIImage imageNamed:@"OutlineSheep.png"];
            break;
        case 12:bgImg.image = [UIImage imageNamed:@"OutlineCow.png"];
            break;
        case 13:bgImg.image = [UIImage imageNamed:@"OutlineCat.png"];
            break;
        case 14:bgImg.image = [UIImage imageNamed:@"OutlineDog.png"];
            break;
        case 15:bgImg.image = [UIImage imageNamed:@"Relax.png"];
            break;
        default:bgImg.image = [UIImage imageNamed:@"Relax.png"];
            break;
    }
    
    
    [self.view addSubview:bgImg];
    [self.view sendSubviewToBack:bgImg];
    [self setUpSharedStuff];
    
    
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

-(IBAction)nextPage:(UIButton *)sender{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"])
    {
        [self performSegueWithIdentifier:@"ToBeReal" sender:sender];
    }
    else {
        NSString *audioString = [[NSBundle mainBundle] pathForResource:@"aumAnimal" ofType:@"caf"];    
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"ChooseColorViewController_iPad:prepareForSegue");
    BeViewController_iPhone *be=[segue destinationViewController];
    be.chosenAnimal=self.chosenAnimal;
    be.thaColor=self.thaColor;
    //Send the selected color to the next view
    
    
}

@end
