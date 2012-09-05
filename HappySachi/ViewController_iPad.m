//
//  ViewController_iPad.m
//  HappySachi
//
//  Created by Ben Boral on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController_iPad.h"

@interface ViewController_iPad ()

@end

@implementation ViewController_iPad





-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"ViewController:viewWillAppear");
    
    //Button was made in storyboard. Now adding attributes to go next screen and showing as a dissolve
    startButtonImg=[UIImage imageNamed:@"Start.png"];
    
    self.startTheApp.frame = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? CGRectMake((self.view.frame.size.width-startButtonImg.size.width), (0.5*self.view.frame.size.height-0.5*self.startButtonImg.size.height), self.startButtonImg.size.width, self.startButtonImg.size.height) : CGRectMake((0.5*self.view.frame.size.width-0.5*startButtonImg.size.width), (self.view.frame.size.height-self.startButtonImg.size.height), self.startButtonImg.size.width, self.startButtonImg.size.height);
    

    [self.startTheApp setBackgroundImage:startButtonImg forState:UIControlStateNormal];
    self.startTheApp.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleTopMargin);
    self.startTheApp.alpha = 0.0;
    [self.view addSubview:startTheApp];
    [UIView beginAnimations: nil context: nil];
    self.startTheApp.alpha = 1.0;
    [UIView commitAnimations];
    
    //adjust background for oreintation
    bgImg.frame=self.view.bounds;
    bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"Default-Landscape.png"] : [UIImage imageNamed:@"Default-Portrait.png"];
    

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;    
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    NSLog(@"ViewControlleriPad:willAutorotateToInterfaceOrientation");
    
    //Toggles between landscape and portrait versions of background image
    bgImg.frame=self.view.bounds;
    bgImg.image = UIInterfaceOrientationIsLandscape(toInterfaceOrientation) ? [UIImage imageNamed:@"Default-Landscape.png"] : [UIImage imageNamed:@"Default-Portrait.png"];
    
     self.startTheApp.frame = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? CGRectMake((self.view.frame.size.width-startButtonImg.size.width), (0.5*self.view.frame.size.height-0.5*self.startButtonImg.size.height), self.startButtonImg.size.width, self.startButtonImg.size.height) : CGRectMake((0.5*self.view.frame.size.width-0.5*startButtonImg.size.width), (self.view.frame.size.height-self.startButtonImg.size.height), self.startButtonImg.size.width, self.startButtonImg.size.height);
    
}

@end
