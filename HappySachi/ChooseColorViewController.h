//
//  ChooseColorViewController.h
//  HappySachi
//
//  Created by Ben Boral on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MySlider.h"
#import "ColorPicker.h"
#import <AVFoundation/AVFoundation.h>
@interface ChooseColorViewController : UIViewController<AVAudioPlayerDelegate>
{
    UIImageView *bgImg;
    UIButton *goToAnimalsButton;
    UIImage *goButtonImg;
    MySlider *slider;
    UIButton *muteButton;
    UIImage *muteImg;
    NSMutableString *selectedColorString;
    UIButton *whatColor;
    ColorPicker *cp;
}
@property (nonatomic, strong) UIImageView *bgImg;
@property (nonatomic, strong) IBOutlet UIButton *goToAnimalsButton;
@property (nonatomic, strong) UIImage *goButtonImg;
@property (nonatomic, strong) IBOutlet UIButton *goBackButton;
@property (nonatomic, strong) UIImage *goBackImg;
@property (nonatomic, strong) MySlider *slider;
@property (nonatomic, strong) UIImage *sliderThumbImg;
@property (nonatomic, strong) IBOutlet UIButton *muteButton;
@property (nonatomic, strong) UIImage *muteImg;
@property (nonatomic, strong) NSMutableString *selectedColorString;
@property (nonatomic, strong) UIButton *whatColor;
@property (strong, nonatomic) ColorPicker *cp;
@property (strong, nonatomic) AVAudioPlayer *player;


-(void)setUpSharedStuff;
-(UIColor *)pixelInfo: (float)withSliderPos fromImage:(UIImage *)image;
-(IBAction)sliderChanged:(UISlider *)sender;
@end
