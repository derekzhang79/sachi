//
//  AumViewController_iPhone.m
//  HappySachi
//
//  Created by Ben Boral on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AumViewController_iPhone.h"

@interface AumViewController_iPhone ()

@end

@implementation AumViewController_iPhone

- (void)viewDidLoad
{
    NSLog(@"AumViewControlleriPhone:viewDidLoad");
    [super viewDidLoad];
    
    //Setting background img
    bgImg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    [bgImg setImage:[UIImage imageNamed:@"Aum.png"]];
    [self.view addSubview:bgImg];
    [self.view sendSubviewToBack:bgImg];
    [self setUpSharedStuff];
}

-(void)viewWillAppear:(BOOL)animated{
    [self playSound];
}


@end

