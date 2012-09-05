//
//  ChooseColorViewController_iPhone.h
//  HappySachi
//
//  Created by Ben Boral on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "ChooseColorViewController.h"
#import "AnimalPickerViewController_iPhone.h"

@interface ChooseColorViewController_iPhone : ChooseColorViewController
@property (strong, nonatomic) AVAudioPlayer *anotherPlayer;

-(IBAction)nextPage:(UIButton *)sender;

@end
