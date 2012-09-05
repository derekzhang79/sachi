//
//  AnimalPickerViewController_iPad.h
//  HappySachi
//
//  Created by Ben Boral on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnimalPickerViewController.h"
#import "SeeViewController_iPad.h"
#import "AumViewController.h"

@interface AnimalPickerViewController_iPad : AnimalPickerViewController <AnimalPickerDelegate>{
    NSArray *landscapeSmallLocs;
    NSArray *portraitSmallLocs;
}

@property (nonatomic, strong) NSArray *landscapeSmallLocs;
@property (nonatomic, strong) NSArray *portraitSmallLocs;

-(void)updateAnimalLocs;


@end
