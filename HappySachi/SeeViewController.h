//
//  SeeViewController.h
//  HappySachi
//
//  Created by Ben Boral on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol SeeVCDelegate
-(void)nextPage:(UIButton *)sender;
@end

@interface SeeViewController : UIViewController <UIGestureRecognizerDelegate, AVAudioPlayerDelegate>
{
    UIColor *thaColor;
    int chosenAnimal;
    UIImageView *bgImg;
    UIButton *goToColorsButton;
    UIImage *goColorsImg;
    UIButton *goAnimalsButton;
    UIImage *goAnimalsImg;
    UIButton *replayButton;
    UIImage *replayImg;
    UIButton *beButton;
    UIImage *beImg;
    id <SeeVCDelegate> delegate;
    NSString *selectedColorString;
    UIImage *muteImg;
    UIButton *muteButton;
    UIButton *goBackButton;
    UIImage *goBackImg;
    UIImage *rawrImg;
    UIButton *rawrButt;
}

@property (nonatomic, strong) UIImage *rawrImg;
@property (nonatomic, strong) UIButton *rawrButt;
@property (nonatomic, strong) UIImage *muteImg;
@property (nonatomic, strong) UIButton *muteButton;
@property (nonatomic, strong) UIImageView *bgImg;
@property (nonatomic, strong) IBOutlet UIButton *goToColorsButton;
@property (nonatomic, strong) UIImage *goColorsImg;
@property (nonatomic, strong) IBOutlet UIButton *goAnimalsButton;
@property (nonatomic, strong) UIImage *goAnimalsImg;
@property (nonatomic, strong) IBOutlet UIButton *replayButton;
@property (nonatomic, strong) UIImage *replayImg;
@property (nonatomic, strong) IBOutlet UIButton *beButton;
@property (nonatomic, strong) UIImage *beImg;
@property (nonatomic, strong) UIColor *thaColor;
@property int chosenAnimal;
@property (nonatomic, strong) NSString *selectedColorString;
@property (nonatomic, strong) UIButton *goBackButton;
@property (nonatomic, strong) UIImage *goBackImg;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) AVAudioPlayer *player2;
@property (strong, nonatomic) NSNumber *sliVal;


-(void)setUpSharedStuff;

@end
