//
//  BeViewController.h
//  HappySachi
//
//  Created by Ben Boral on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol BeVCDelegate
-(void)nextPage:(UIButton *)sender;
@end

@interface BeViewController : UIViewController <UIGestureRecognizerDelegate, AVAudioPlayerDelegate>
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
    UIButton *starButton;
    UIImage *starImg;
    id <BeVCDelegate> delegate;
    UIButton *muteButton;
    UIImage *muteImg;
    UIButton *goBackAumButton;
    UIImage *goBackAumImg;
    UIButton *goBackButt;
    UIImage *goBackImg;
    UIImage *rawrImg;
    UIButton *rawrButt;

}
@property (nonatomic, strong) UIButton *muteButton;
@property (nonatomic, strong) UIImage *muteImg;
@property (nonatomic, strong) UIImageView *bgImg;
@property (nonatomic, strong) IBOutlet UIButton *goToColorsButton;
@property (nonatomic, strong) UIImage *goColorsImg;
@property (nonatomic, strong) IBOutlet UIButton *goAnimalsButton;
@property (nonatomic, strong) UIImage *goAnimalsImg;
@property (nonatomic, strong) IBOutlet UIButton *replayButton;
@property (nonatomic, strong) UIImage *replayImg;
@property (nonatomic, strong) IBOutlet UIButton *starButton;
@property (nonatomic, strong) UIImage *starImg;
@property (nonatomic, strong) UIColor *thaColor;
@property (nonatomic, strong) IBOutlet UIButton *goBackAumButton;
@property (nonatomic, strong) UIImage *goBackAumImg;
@property (nonatomic, strong) UIButton *goBackButt;
@property (nonatomic, strong) UIImage *goBackImg;
@property int chosenAnimal;
@property (nonatomic, strong) UIImage *rawrImg;
@property (nonatomic, strong) UIButton *rawrButt;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) AVAudioPlayer *player2;


-(void)setUpSharedStuff;


@end