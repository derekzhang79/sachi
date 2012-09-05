//
//  SeeViewController_iPad.h
//  HappySachi
//
//  Created by Ben Boral on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SeeViewController.h"
#import "BeViewController_iPad.h"
#import <AVFoundation/AVFoundation.h>

@interface SeeViewController_iPad : SeeViewController <SeeVCDelegate>
@property (strong, nonatomic) AVAudioPlayer *anotherPlayer;

-(IBAction)nextPage:(UIButton *)sender;

@end
