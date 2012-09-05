//
//  AnimalPickerViewController.h
//  HappySachi
//
//  Created by Ben Boral on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@protocol AnimalPickerDelegate
    -(void)nextPage:(UIButton *)sender;
@end

@interface AnimalPickerViewController : UIViewController <UIGestureRecognizerDelegate, AVAudioPlayerDelegate>
{
    UIColor *selectedColor;
    UIImageView *bgImg;
    UIButton *goBackAumButton;
    UIImage *goBackAumImg;
    UIButton *goBackColorsButton;
    UIImage *goBackColorsImg;
    int chosenAnimal;
    NSArray *buttonArray;
    UIImageView *blownUpAnimal;
    id <AnimalPickerDelegate> delegate;
    NSMutableArray *smallAnimalLocs;
    UIButton *seeButton;
    UIImage *muteImg;
    UIButton *muteButton;
    NSString *selectedColorString;

}
@property (nonatomic, strong) UIImageView *bgImg;
@property (nonatomic, strong) IBOutlet UIButton *goBackColorsButton;
@property (nonatomic, strong) UIImage *goBackColorsImg;
@property (nonatomic, strong) IBOutlet UIButton *goBackAumButton;
@property (nonatomic, strong) UIImage *goBackAumImg;
@property int chosenAnimal;
@property (nonatomic, strong) NSArray *buttonArray;
@property (nonatomic, strong) UIImageView *blownUpAnimal;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) NSMutableArray *smallAnimalLocs;
@property (nonatomic, strong) UIButton *seeButton;
@property (nonatomic, strong) UIImage *muteImg;
@property (nonatomic, strong) UIButton *muteButton;
@property (nonatomic, strong) NSString *selectedColorString;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) NSNumber *sliVal;



-(void)setUpSharedStuff;
@end