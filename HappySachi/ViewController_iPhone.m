//
//  ViewController_iPhone.m
//  HappySachi
//
//  Created by Ben Boral on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController_iPhone.h"

@interface ViewController_iPhone ()

@end

@implementation ViewController_iPhone

-(void) viewWillAppear:(BOOL)animated{
    //Button was made in storyboard. Now adding attributes to go next screen and showing as a dissolve
    startButtonImg=[UIImage imageNamed:@"Start.png"];
    self.startTheApp.frame=CGRectMake((0.5*self.view.frame.size.width-0.5*startButtonImg.size.width), (self.view.frame.size.height-self.startButtonImg.size.height), self.startButtonImg.size.width, self.startButtonImg.size.height);
    [self.startTheApp setBackgroundImage:startButtonImg forState:UIControlStateNormal];
    self.startTheApp.alpha = 0.0;
    [self.view addSubview:startTheApp];
    [UIView beginAnimations: nil context: nil];
    self.startTheApp.alpha = 1.0;
    [UIView commitAnimations];
}




@end
