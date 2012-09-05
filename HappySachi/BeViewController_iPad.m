//
//  BeViewController_iPad.m
//  HappySachi
//
//  Created by Ben Boral on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BeViewController_iPad.h"

@interface BeViewController_iPad ()

@end

@implementation BeViewController_iPad



- (void)viewDidLoad
{
    NSLog(@"SeeViewControllerIPAD:viewDidLoad");
    [super viewDidLoad];
    
    //load background image based on orientation
    bgImg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    switch(chosenAnimal)
    {
        case 1:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"LadybugPose-Landscape.png"] : [UIImage imageNamed:@"LadybugPose-Portrait.png"];
            break;
        case 2:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"LionPose-Landscape.png"] : [UIImage imageNamed:@"LionPose-Portrait.png"];
            break;
        case 3:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"BeePose-Landscape.png"] : [UIImage imageNamed:@"BeePose-Portrait.png"];
            break;
        case 4:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"FrogPose-Landscape.png"] : [UIImage imageNamed:@"FrogPose-Portrait.png"];
            break;
        case 5:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"FishPose-Landscape.png"] : [UIImage imageNamed:@"FishPose-Portrait.png"];
            break;
        case 6:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"SnakePose-Landscape.png"] : [UIImage imageNamed:@"SnakePose-Portrait.png"];
            break;
        case 7:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"PigPose-Landscape.png"] : [UIImage imageNamed:@"PigPose-Portrait.png"];
            break;
        case 8:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"ElephantPose-Landscape.png"] : [UIImage imageNamed:@"ElephantPose-Portrait.png"];
            break;
        case 9:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"FlamingoPose-Landscape.png"] : [UIImage imageNamed:@"FlamingoPose-Portrait.png"];
            break;
        case 10:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"ButterflyPose-Landscape.png"] : [UIImage imageNamed:@"ButterflyPose-Portrait.png"];
            break;
        case 11:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"SheepPose-Landscape.png"] : [UIImage imageNamed:@"SheepPose-Portrait.png"];
            break;
        case 12:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"CowPose-Landscape.png"] : [UIImage imageNamed:@"CowPose-Portrait.png"];
            break;
        case 13:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"CatPose-Landscape.png"] : [UIImage imageNamed:@"CatPose-Portrait.png"];
            break;
        case 14:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"DogPose-Landscape.png"] : [UIImage imageNamed:@"DogPose-Portrait.png"];
            break;
        case 15:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"RelaxPose-Landscape.png"] : [UIImage imageNamed:@"RelaxPose-Portrait.png"];
            break;
        default:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"RelaxPose-Landscape.png"] : [UIImage imageNamed:@"RelaxPose-Portrait.png"];
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
        case 1:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"LadybugPose-Landscape.png"] : [UIImage imageNamed:@"LadybugPose-Portrait.png"];
            break;
        case 2:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"LionPose-Landscape.png"] : [UIImage imageNamed:@"LionPose-Portrait.png"];
            break;
        case 3:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"BeePose-Landscape.png"] : [UIImage imageNamed:@"BeePose-Portrait.png"];
            break;
        case 4:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"FrogPose-Landscape.png"] : [UIImage imageNamed:@"FrogPose-Portrait.png"];
            break;
        case 5:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"FishPose-Landscape.png"] : [UIImage imageNamed:@"FishPose-Portrait.png"];
            break;
        case 6:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"SnakePose-Landscape.png"] : [UIImage imageNamed:@"SnakePose-Portrait.png"];
            break;
        case 7:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"PigPose-Landscape.png"] : [UIImage imageNamed:@"PigPose-Portrait.png"];
            break;
        case 8:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"ElephantPose-Landscape.png"] : [UIImage imageNamed:@"ElephantPose-Portrait.png"];
            break;
        case 9:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"FlamingoPose-Landscape.png"] : [UIImage imageNamed:@"FlamingoPose-Portrait.png"];
            break;
        case 10:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"ButterflyPose-Landscape.png"] : [UIImage imageNamed:@"ButterflyPose-Portrait.png"];
            break;
        case 11:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"SheepPose-Landscape.png"] : [UIImage imageNamed:@"SheepPose-Portrait.png"];
            break;
        case 12:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"CowPose-Landscape.png"] : [UIImage imageNamed:@"CowPose-Portrait.png"];
            break;
        case 13:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"CatPose-Landscape.png"] : [UIImage imageNamed:@"CatPose-Portrait.png"];
            break;
        case 14:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"DogPose-Landscape.png"] : [UIImage imageNamed:@"DogPose-Portrait.png"];
            break;
        case 15:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"RelaxPose-Landscape.png"] : [UIImage imageNamed:@"RelaxPose-Portrait.png"];
            break;
        default:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"RelaxPose-Landscape.png"] : [UIImage imageNamed:@"RelaxPose-Portrait.png"];
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
        case 1:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"LadybugPose-Landscape.png"] : [UIImage imageNamed:@"LadybugPose-Portrait.png"];
            break;
        case 2:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"LionPose-Landscape.png"] : [UIImage imageNamed:@"LionPose-Portrait.png"];
            break;
        case 3:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"BeePose-Landscape.png"] : [UIImage imageNamed:@"BeePose-Portrait.png"];
            break;
        case 4:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"FrogPose-Landscape.png"] : [UIImage imageNamed:@"FrogPose-Portrait.png"];
            break;
        case 5:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"FishPose-Landscape.png"] : [UIImage imageNamed:@"FishPose-Portrait.png"];
            break;
        case 6:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"SnakePose-Landscape.png"] : [UIImage imageNamed:@"SnakePose-Portrait.png"];
            break;
        case 7:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"PigPose-Landscape.png"] : [UIImage imageNamed:@"PigPose-Portrait.png"];
            break;
        case 8:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"ElephantPose-Landscape.png"] : [UIImage imageNamed:@"ElephantPose-Portrait.png"];
            break;
        case 9:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"FlamingoPose-Landscape.png"] : [UIImage imageNamed:@"FlamingoPose-Portrait.png"];
            break;
        case 10:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"ButterflyPose-Landscape.png"] : [UIImage imageNamed:@"ButterflyPose-Portrait.png"];
            break;
        case 11:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"SheepPose-Landscape.png"] : [UIImage imageNamed:@"SheepPose-Portrait.png"];
            break;
        case 12:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"CowPose-Landscape.png"] : [UIImage imageNamed:@"CowPose-Portrait.png"];
            break;
        case 13:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"CatPose-Landscape.png"] : [UIImage imageNamed:@"CatPose-Portrait.png"];
            break;
        case 14:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"DogPose-Landscape.png"] : [UIImage imageNamed:@"DogPose-Portrait.png"];
            break;
        case 15:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"RelaxPose-Landscape.png"] : [UIImage imageNamed:@"RelaxPose-Portrait.png"];
            break;
        default:bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"RelaxPose-Landscape.png"] : [UIImage imageNamed:@"RelaxPose-Portrait.png"];
            break;
    }
}

-(void)nextPage:(UIButton *)sender{
    
    [self performSegueWithIdentifier:@"ToStarfish" sender:sender];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"BeViewController_iPhone:prepareForSegue");
    SeeViewController_iPad *see=[segue destinationViewController];
    see.chosenAnimal=15;
    see.thaColor=self.thaColor;
    //Send the selected color to the next view
}

@end