//
//  SeeViewController_iPhone.h
//  HappySachi
//
//  Created by Ben Boral on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "SeeViewController.h"
#import "BeViewController_iPhone.h"

@interface SeeViewController_iPhone : SeeViewController<SeeVCDelegate>
@property (strong, nonatomic) AVAudioPlayer *anotherPlayer;
-(IBAction)nextPage:(UIButton *)sender;


@end
