//
//  ViewController.h
//  HappySachi
//
//  Created by Ben Boral on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <UIAlertViewDelegate, MFMailComposeViewControllerDelegate, AVAudioPlayerDelegate>{
    UIImageView *bgImg;
    UIButton *startTheApp;
    UIImage *startButtonImg;
    UIImage *muteImg;
    UIButton *muteButton;
}
@property (nonatomic, strong) UIImageView *bgImg;
@property (nonatomic, strong) IBOutlet UIButton *startTheApp;
@property (nonatomic, strong) UIImage *startButtonImg;
@property (nonatomic, strong) IBOutlet UIButton *muteButton;
@property (nonatomic, strong) UIImage *muteImg;
@property (strong, nonatomic) AVAudioPlayer *player;


-(IBAction)emailInfoPopUp:(id)sender;
-(IBAction)collectEmail:(id)sender;
@end
