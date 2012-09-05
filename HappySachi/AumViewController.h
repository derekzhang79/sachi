//
//  AumViewController.h
//  HappySachi
//
//  Created by Ben Boral on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AumViewController : UIViewController <UIGestureRecognizerDelegate, AVAudioPlayerDelegate>
{
    UIImageView *bgImg;
    UIButton *goToColorsButton;
    UIImage *goColorsImg;
    UIButton *goBackButton;
    UIImage *goBackImg;
    UIButton *muteButton;
    UIImage *muteImg;
    UIImageView *bigSmile;
    UITapGestureRecognizer *sachiTap;
     
}
@property (nonatomic, strong) UIImageView *bgImg;
@property (nonatomic, strong) IBOutlet UIButton *goToColorsButton;
@property (nonatomic, strong) UIImage *goColorsImg;
@property (nonatomic, strong) IBOutlet UIButton *goBackButton;
@property (nonatomic, strong) UIImage *goBackImg;
@property (nonatomic, strong) IBOutlet UIButton *muteButton;
@property (nonatomic, strong) UIImage *muteImg;
@property (nonatomic, strong) UIImageView *bigSmile;
@property (nonatomic, strong) UIImageView *leftEye;
@property (nonatomic, strong) UIImageView *rightEye;
@property (nonatomic, strong) UITapGestureRecognizer *sachiTap;
@property (strong, nonatomic) AVAudioPlayer *player;

-(void)setUpSharedStuff;
-(void)playSound;
@end
