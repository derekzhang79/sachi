//
//  AumViewController_iPad.m
//  HappySachi
//
//  Created by Ben Boral on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AumViewController_iPad.h"

@interface AumViewController_iPad ()

@end

@implementation AumViewController_iPad

- (void)viewDidLoad
{
    NSLog(@"AumViewControllerIPAD:viewDidLoad");
    [super viewDidLoad];
    
    //load background image based on orientation
    bgImg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"Aum-Landscape.png"] : [UIImage imageNamed:@"Aum-Portrait.png"];
    [self.view addSubview:bgImg];
    [self.view sendSubviewToBack:bgImg];
    [self setUpSharedStuff];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    //Setting background img based on orientation
    bgImg.frame=self.view.bounds;
    bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"Aum-Landscape.png"] : [UIImage imageNamed:@"Aum-Portrait.png"];    
    [self playSound];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;    
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    NSLog(@"AumViewControlleriPad:willAutorotateToInterfaceOrientation");
    
    //Toggles between landscape and portrait versions of background image
    bgImg.frame=self.view.bounds;
    bgImg.image = UIInterfaceOrientationIsLandscape(toInterfaceOrientation) ? [UIImage imageNamed:@"Aum-Landscape.png"] : [UIImage imageNamed:@"Aum-Portrait.png"];
}

@end
