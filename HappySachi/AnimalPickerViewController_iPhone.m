//
//  AnimalPickerViewController_iPhone.m
//  HappySachi
//
//  Created by Ben Boral on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnimalPickerViewController_iPhone.h"

@interface AnimalPickerViewController_iPhone ()

@end

@implementation AnimalPickerViewController_iPhone


- (void)viewDidLoad
{
    NSLog(@"AnimalPickerViewControlleriPhone:viewDidLoad");
    [super viewDidLoad];
    
    //Setting background img
    bgImg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    [bgImg setImage:[UIImage imageNamed:@"AnimalPicker.png"]];
    [self.view addSubview:bgImg];
    [self.view sendSubviewToBack:bgImg];
    
    NSLog(@"width is %f",self.view.frame.size.width);
    NSLog(@"height is %f", self.view.frame.size.height);
    
    smallAnimalLocs=[[NSMutableArray alloc] initWithObjects:
                     [NSValue valueWithCGPoint:CGPointMake(0.08*self.view.frame.size.width, 0.12*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.32*self.view.frame.size.width, 0.11*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.54*self.view.frame.size.width, 0.11*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.75*self.view.frame.size.width, 0.13*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.08*self.view.frame.size.width, 0.33*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.28*self.view.frame.size.width, 0.31*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.51*self.view.frame.size.width, 0.30*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.74*self.view.frame.size.width, 0.33*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.05*self.view.frame.size.width, 0.54*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.3*self.view.frame.size.width, 0.50*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.52*self.view.frame.size.width, 0.51*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.73*self.view.frame.size.width, 0.54*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.09*self.view.frame.size.width, 0.7*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.32*self.view.frame.size.width, 0.69*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.52*self.view.frame.size.width, 0.7*self.view.frame.size.height)], 
                     [NSValue valueWithCGPoint:CGPointMake(0.74*self.view.frame.size.width, 0.7*self.view.frame.size.height)], nil];

    [self setUpSharedStuff];

}

-(void)nextPage:(UIButton *)sender{
    switch (sender.tag) {
        case 17:
            [self performSegueWithIdentifier:@"ToBe" sender:sender];
            break;
        case 0:
            [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
            break;
        default:
            [self performSegueWithIdentifier:@"ToBe" sender:sender];
            break;
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"ChooseColorViewController_iPad:prepareForSegue");
    SeeViewController_iPhone *see=[segue destinationViewController];
    see.chosenAnimal=self.chosenAnimal;
    see.thaColor=self.selectedColor;
    NSLog(@"AnaimalPicker:prepareFOrSegue, selectedColor is %@", self.selectedColorString);
    see.selectedColorString=self.selectedColorString;
    see.sliVal=self.sliVal;
    //Send the selected color to the next view
    
    
}

@end
