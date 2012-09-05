//
//  AnimalPickerViewController_iPad.m
//  HappySachi
//
//  Created by Ben Boral on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnimalPickerViewController_iPad.h"

@interface AnimalPickerViewController_iPad ()

@end

@implementation AnimalPickerViewController_iPad
@synthesize portraitSmallLocs, landscapeSmallLocs;
- (void)viewDidLoad
{
    NSLog(@"AnimalPickerViewControllerIPAD:viewDidLoad");
    [super viewDidLoad];
    

    
    //set background image based on orientation
    bgImg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"AnimalPicker-Landscape.png"] : [UIImage imageNamed:@"AnimalPicker-Portrait.png"];
    [self.view addSubview:bgImg];
    [self.view sendSubviewToBack:bgImg];
    
    NSLog(@"view width is %f", self.view.frame.size.width);
    
    
    
    float portraitHeight=self.view.frame.size.height;
    float landscapeWidth=self.view.frame.size.width;
    
    if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
    {
        landscapeWidth+=20;
    }
    else {
        portraitHeight+=20;
    }
    
    self.portraitSmallLocs= [[NSArray alloc] initWithObjects:
                    [NSValue valueWithCGPoint:CGPointMake(0.16*landscapeWidth, 0.14*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.38*landscapeWidth, 0.12*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.58*landscapeWidth, 0.12*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.77*landscapeWidth, 0.15*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.15*landscapeWidth, 0.36*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.34*landscapeWidth, 0.33*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.55*landscapeWidth, 0.33*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.75*landscapeWidth, 0.36*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.13*landscapeWidth, 0.58*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.35*landscapeWidth, 0.52*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.55*landscapeWidth, 0.55*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.74*landscapeWidth, 0.57*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.16*landscapeWidth, 0.74*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.37*landscapeWidth, 0.74*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.56*landscapeWidth, 0.75*portraitHeight)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.76*landscapeWidth, 0.74*portraitHeight)], nil];
    
    self.landscapeSmallLocs= [[NSArray alloc] initWithObjects:
                    [NSValue valueWithCGPoint:CGPointMake(0.12*portraitHeight, 0.06*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.34*portraitHeight, 0.1*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.58*portraitHeight, 0.06*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.78*portraitHeight, 0.07*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.12*portraitHeight, 0.27*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.33*portraitHeight, 0.32*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.55*portraitHeight, 0.31*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.79*portraitHeight, 0.29*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.11*portraitHeight, 0.49*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.35*portraitHeight, 0.51*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.57*portraitHeight, 0.52*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.78*portraitHeight, 0.51*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.11*portraitHeight, 0.71*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.36*portraitHeight, 0.72*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.56*portraitHeight, 0.74*landscapeWidth)], 
                    [NSValue valueWithCGPoint:CGPointMake(0.79*portraitHeight, 0.71*landscapeWidth)], nil];
    self.smallAnimalLocs = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? (NSMutableArray *)self.landscapeSmallLocs : (NSMutableArray *)self.portraitSmallLocs ;
    //NSLog(@"Is position landscape? %d", UIInterfaceOrientationIsLandscape(self.interfaceOrientation));
    NSLog(@"Dimensions %f %f", landscapeWidth, portraitHeight);
    NSLog(@"portraitHeight is %f, lanscape width is %f", portraitHeight, landscapeWidth);
    //NSLog(@"landscape positions:%@", self.landscapeSmallLocs);
    //NSLog(@"portrait positions:%@", self.portraitSmallLocs);
    
    [self setUpSharedStuff];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    //Setting background img based on orientation
    bgImg.frame=self.view.bounds;
    bgImg.image = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? [UIImage imageNamed:@"AnimalPicker-Landscape.png"] : [UIImage imageNamed:@"AnimalPicker-Portrait.png"];    
    
    self.smallAnimalLocs = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? (NSMutableArray *)self.landscapeSmallLocs : (NSMutableArray *)self.portraitSmallLocs ;
    
    if(UIInterfaceOrientationIsPortrait(self.interfaceOrientation)){
        UIImageView *butImgV=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BackToAum.png"]];
        NSMutableString *name=(NSMutableString*)@"BackToAum";
        
        for(int i=0; i<16; i++)
        {
            switch (i) {
                case 0:
                    name=(NSMutableString*)@"BackToAum-Portrait.png";
                    break;
                case 1:
                    name=(NSMutableString*)@"Ladybug-Portrait.png";
                    break;
                case 2:
                    name=(NSMutableString*)@"Lion-Portrait.png";
                    break;
                case 3:
                    name=(NSMutableString*)@"Bee-Portrait.png";
                    break;
                case 4:
                    name=(NSMutableString*)@"Frog-Portrait.png";
                    break;
                case 5:
                    name=(NSMutableString*)@"Fish-Portrait.png";
                    break;
                case 6:
                    name=(NSMutableString*)@"Snake-Portrait.png";
                    break;
                case 7:
                    name=(NSMutableString*)@"Pig-Portrait.png";
                    break;
                case 8:
                    name=(NSMutableString*)@"Elephant-Portrait.png";
                    break;
                case 9:
                    name=(NSMutableString*)@"Flamingo-Portrait.png";
                    break;
                case 10:
                    name=(NSMutableString*)@"Butterfly-Portrait.png";
                    break;
                case 11:
                    name=(NSMutableString*)@"Sheep-Portrait.png";
                    break;
                case 12:
                    name=(NSMutableString*)@"Cow-Portrait.png";
                    break;
                case 13:
                    name=(NSMutableString*)@"Cat-Portrait.png";
                    break;
                case 14:
                    name=(NSMutableString*)@"Dog-Portrait.png";
                    break;
                default:
                    name=(NSMutableString*)@"Starfish-Portrait.png";
                    break;
            }
            
            butImgV.image=[UIImage imageNamed:name];
            [[self.buttonArray objectAtIndex:i]setBackgroundImage:butImgV.image forState:UIControlStateNormal];
            [((UIButton*)[self.buttonArray objectAtIndex:i]) setFrame:CGRectMake([[self.smallAnimalLocs objectAtIndex:i] CGPointValue].x, [[self.smallAnimalLocs objectAtIndex:i] CGPointValue].y, butImgV.image.size.width, butImgV.image.size.height)];
        }
    }
    
    [self updateAnimalLocs];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;    
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    self.smallAnimalLocs = !UIInterfaceOrientationIsLandscape(fromInterfaceOrientation) ? (NSMutableArray *)self.landscapeSmallLocs : (NSMutableArray *)self.portraitSmallLocs ;
    [self updateAnimalLocs];
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    NSLog(@"AnimalPickerViewControlleriPad:willAutorotateToInterfaceOrientation");
    
    //Toggles between landscape and portrait versions of background image
    bgImg.frame=self.view.bounds;
    bgImg.image = UIInterfaceOrientationIsLandscape(toInterfaceOrientation) ? [UIImage imageNamed:@"AnimalPicker-Landscape.png"] : [UIImage imageNamed:@"AnimalPicker-Portrait.png"];
    
    self.smallAnimalLocs = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? (NSMutableArray *)self.landscapeSmallLocs : (NSMutableArray *)self.portraitSmallLocs;
    
    if(UIInterfaceOrientationIsPortrait(self.interfaceOrientation)){
        UIImageView *butImgV=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BackToAum.png"]];
        NSMutableString *name=(NSMutableString*)@"BackToAum";
        
        for(int i=0; i<16; i++)
        {
            switch (i) {
                case 0:
                    name=(NSMutableString*)@"BackToAum-Portrait.png";
                    break;
                case 1:
                    name=(NSMutableString*)@"Ladybug-Portrait.png";
                    break;
                case 2:
                    name=(NSMutableString*)@"Lion-Portrait.png";
                    break;
                case 3:
                    name=(NSMutableString*)@"Bee-Portrait.png";
                    break;
                case 4:
                    name=(NSMutableString*)@"Frog-Portrait.png";
                    break;
                case 5:
                    name=(NSMutableString*)@"Fish-Portrait.png";
                    break;
                case 6:
                    name=(NSMutableString*)@"Snake-Portrait.png";
                    break;
                case 7:
                    name=(NSMutableString*)@"Pig-Portrait.png";
                    break;
                case 8:
                    name=(NSMutableString*)@"Elephant-Portrait.png";
                    break;
                case 9:
                    name=(NSMutableString*)@"Flamingo-Portrait.png";
                    break;
                case 10:
                    name=(NSMutableString*)@"Butterfly-Portrait.png";
                    break;
                case 11:
                    name=(NSMutableString*)@"Sheep-Portrait.png";
                    break;
                case 12:
                    name=(NSMutableString*)@"Cow-Portrait.png";
                    break;
                case 13:
                    name=(NSMutableString*)@"Cat-Portrait.png";
                    break;
                case 14:
                    name=(NSMutableString*)@"Dog-Portrait.png";
                    break;
                default:
                    name=(NSMutableString*)@"Starfish-Portrait.png";
                    break;
            }
            NSLog(@"Reset to Portrait");
            butImgV.image=[UIImage imageNamed:name];
            [[self.buttonArray objectAtIndex:i]setBackgroundImage:butImgV.image forState:UIControlStateNormal];
            [((UIButton*)[self.buttonArray objectAtIndex:i]) setFrame:CGRectMake([[self.smallAnimalLocs objectAtIndex:i] CGPointValue].x, [[self.smallAnimalLocs objectAtIndex:i] CGPointValue].y, butImgV.image.size.width, butImgV.image.size.height)];
        }
    }
    else {
        UIImageView *butImgV=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BackToAum.png"]];
        NSMutableString *name=(NSMutableString*)@"BackToAum";
        
        for(int i=0; i<16; i++)
        {
            switch (i) {
                case 0:
                    name=(NSMutableString*)@"BackToAum.png";
                    break;
                case 1:
                    name=(NSMutableString*)@"Ladybug.png";
                    break;
                case 2:
                    name=(NSMutableString*)@"Lion.png";
                    break;
                case 3:
                    name=(NSMutableString*)@"Bee.png";
                    break;
                case 4:
                    name=(NSMutableString*)@"Frog.png";
                    break;
                case 5:
                    name=(NSMutableString*)@"Fish.png";
                    break;
                case 6:
                    name=(NSMutableString*)@"Snake.png";
                    break;
                case 7:
                    name=(NSMutableString*)@"Pig.png";
                    break;
                case 8:
                    name=(NSMutableString*)@"Elephant.png";
                    break;
                case 9:
                    name=(NSMutableString*)@"Flamingo.png";
                    break;
                case 10:
                    name=(NSMutableString*)@"Butterfly.png";
                    break;
                case 11:
                    name=(NSMutableString*)@"Sheep.png";
                    break;
                case 12:
                    name=(NSMutableString*)@"Cow.png";
                    break;
                case 13:
                    name=(NSMutableString*)@"Cat.png";
                    break;
                case 14:
                    name=(NSMutableString*)@"Dog.png";
                    break;
                default:
                    name=(NSMutableString*)@"StarFish.png";
                    break;
            }
            NSLog(@"reset to Landscape images");
            butImgV.image=[UIImage imageNamed:name];
            [[self.buttonArray objectAtIndex:i]setBackgroundImage:butImgV.image forState:UIControlStateNormal];
            [((UIButton*)[self.buttonArray objectAtIndex:i]) setFrame:CGRectMake([[self.smallAnimalLocs objectAtIndex:i] CGPointValue].x, [[self.smallAnimalLocs objectAtIndex:i] CGPointValue].y, butImgV.image.size.width, butImgV.image.size.height)];
        }
    }
    
    [self updateAnimalLocs];
}

-(void)nextPage:(UIButton *)sender{
    NSLog(@"AnimalPickeriPad:nextPage");
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
    SeeViewController_iPad *see=[segue destinationViewController];
    see.chosenAnimal=self.chosenAnimal;
    see.thaColor=self.selectedColor;
    NSLog(@"AnaimalPicker:prepareFOrSegue, selectedColor is %@", self.selectedColorString);

    see.selectedColorString=self.selectedColorString;
    see.sliVal=self.sliVal;
    //Send the selected color to the next view
    
    
}



-(void)updateAnimalLocs{
    NSLog(@"FOr updating the blownup img, view width is %f", self.view.frame.size.width);
    NSLog(@"FOr updating the blownup img, img width is %f", self.blownUpAnimal.image.size.width);
    if (self.view.frame.size.width>self.blownUpAnimal.image.size.width) {
            self.blownUpAnimal.frame=CGRectMake((self.view.frame.size.width-self.blownUpAnimal.image.size.width)/2.0, (self.view.frame.size.height-self.blownUpAnimal.image.size.height)/2.0, self.blownUpAnimal.image.size.width, self.blownUpAnimal.image.size.height);
    }
    else{
        self.blownUpAnimal.frame=CGRectMake(0, (self.view.frame.size.height-self.blownUpAnimal.image.size.height)/2.0, self.view.frame.size.width, self.blownUpAnimal.image.size.height);
    }
    
    self.seeButton.frame=CGRectMake(blownUpAnimal.frame.size.width-self.seeButton.frame.size.width, blownUpAnimal.frame.size.height-self.seeButton.frame.size.height, self.seeButton.frame.size.width, self.seeButton.frame.size.height);
    
    //self.blownUpAnimal.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin);
    
    
    for(int i=0;i<[self.buttonArray count];i++){
        if(i<16)
        {
            [((UIButton*)[self.buttonArray objectAtIndex:i]) setFrame:CGRectMake([[self.smallAnimalLocs objectAtIndex:i] CGPointValue].x, [[self.smallAnimalLocs objectAtIndex:i] CGPointValue].y, ((UIButton*)[self.buttonArray objectAtIndex:i]).frame.size.width, ((UIButton*)[self.buttonArray objectAtIndex:i]).frame.size.height)];
            
        }
        
        
    }
}

@end
