//
//  BeViewController_iPhone.m
//  HappySachi
//
//  Created by Ben Boral on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BeViewController_iPhone.h"

@interface BeViewController_iPhone ()

@end

@implementation BeViewController_iPhone

- (void)viewDidLoad
{
    NSLog(@"SeeViewControlleriPhone:viewDidLoad");
    [super viewDidLoad];
    
    //Setting background img
    bgImg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    
    [self setUpSharedStuff];
    
    switch(chosenAnimal)
    {
        case 1:bgImg.image = [UIImage imageNamed:@"LadybugPose.png"];
            break;
        case 2:bgImg.image = [UIImage imageNamed:@"LionPose.png"];
            break;
        case 3:bgImg.image = [UIImage imageNamed:@"BeePose.png"];
            break;
        case 4:bgImg.image = [UIImage imageNamed:@"FrogPose.png"];
            break;
        case 5:bgImg.image = [UIImage imageNamed:@"FishPose.png"];
            break;
        case 6:bgImg.image = [UIImage imageNamed:@"SnakePose.png"];
            break;
        case 7:bgImg.image = [UIImage imageNamed:@"PigPose.png"];
            break;
        case 8:bgImg.image = [UIImage imageNamed:@"ElephantPose.png"];
            break;
        case 9:bgImg.image = [UIImage imageNamed:@"FlamingoPose.png"];
            break;
        case 10:bgImg.image =[UIImage imageNamed:@"ButterflyPose.png"];
            break;
        case 11:bgImg.image =[UIImage imageNamed:@"SheepPose.png"];
            break;
        case 12:bgImg.image = [UIImage imageNamed:@"CowPose.png"];
            break;
        case 13:bgImg.image = [UIImage imageNamed:@"CatPose.png"];
            break;
        case 14:bgImg.image = [UIImage imageNamed:@"DogPose.png"];
            break;
        case 15:bgImg.image = [UIImage imageNamed:@"RelaxPose.png"];
            break;
        default:bgImg.image = [UIImage imageNamed:@"RelaxPose.png"];
            break;
    }
    
    
    [self.view addSubview:bgImg];
    [self.view sendSubviewToBack:bgImg];
    [self setUpSharedStuff];
    
    
}

-(void)nextPage:(UIButton *)sender{
    
    [self performSegueWithIdentifier:@"ToStarfish" sender:sender];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"BeViewController_iPhone:prepareForSegue");
    SeeViewController_iPhone *see=[segue destinationViewController];
    see.chosenAnimal=15;
    see.thaColor=self.thaColor;
    //Send the selected color to the next view
}
    

@end
