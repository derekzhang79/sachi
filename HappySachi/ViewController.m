//
//  ViewController.m
//  HappySachi
//
//  Created by Ben Boral on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AumViewController.h"
#import "SubscribeAlertView.h"
#import "Reachability.h"
#import "FlurryAnalytics.h"


@interface ViewController ()

@end


@implementation ViewController

@synthesize bgImg;
@synthesize startTheApp;
@synthesize startButtonImg;
@synthesize muteImg;
@synthesize muteButton;
@synthesize player;

- (void)viewDidLoad
{
    NSLog(@"ViewController:viewDidLoad");
    [super viewDidLoad];
    NSLog(@"Current Mute Status is %d", [[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"]);

    //Setting background img
        
    bgImg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    [bgImg setImage:[UIImage imageNamed:@"Default.png"]];
    
    //UImage *image = [UIImage imageNamed:@"Default.png"];
    //self.view.layer.contents = (id) image.CGImage;
    
    [self.view addSubview:bgImg];
    [self.view sendSubviewToBack:bgImg];
    
    [FlurryAnalytics logEvent:@"Splash Screen"];

}



-(IBAction)emailInfoPopUp:(id)sender{
    UIAlertView *email=[[UIAlertView alloc] initWithTitle:@"Email Happy Sachi" message:@"Happy Sachi loves feedback. Happy Sachi also sends email updates to her subscribers." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Email Happy Sachi", @"Subscribe To Happy Sachi", nil];
    [email show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1)
    {
        if([MFMailComposeViewController canSendMail]) {
            MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
            mailCont.mailComposeDelegate = self;
            [mailCont setToRecipients:[NSArray arrayWithObject:@"happysachis@gmail.com"]];
            [mailCont setSubject:@"Sachi Feedback"];
            [self presentModalViewController:mailCont animated:YES];
        }
        else {
            UIAlertView *oops=[[UIAlertView alloc] initWithTitle:@"Oops" message:@"Looks like this device can't send email." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            [oops show];
        }
    }
    else if(buttonIndex==2)
    {
        [self collectEmail:alertView];
    }
}



-(IBAction)collectEmail:(id)sender{
    NSLog(@"ViewController:emailInfoPopup");
    
    if([self reachable])
    {
        SubscribeAlertView *alert = [[SubscribeAlertView alloc] initWithTitle:@"Sachi's Email List" 
                                                                      message:@"Join Sachi's Email List for the latest information about Sachi's Yoga."
                                                                       apiKey:@"2b06b92a1b0230d94de6be122b618bb9-us5" 
                                                                       listId:@"e3e71195b2" 
                                                            cancelButtonTitle:@"Cancel"
                                                         subscribeButtonTitle:@"Sign Up"];
        [alert show];
    }

}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult: (MFMailComposeResult)result error: (NSError*)error {

[self dismissModalViewControllerAnimated:YES];

}


-(BOOL)reachable {
    NSLog(@"ViewController:reachable");
    Reachability *r = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStatus = [r currentReachabilityStatus];
    
    if(internetStatus != ReachableViaWiFi && internetStatus !=ReachableViaWWAN) {
        
        UIAlertView *alertView =[[UIAlertView alloc] initWithTitle:@"No Connectivity" message:@"Sorry, Sachi needs internet to do that. Please connect to the internet and try again." delegate:self     cancelButtonTitle:@"Okay"otherButtonTitles:nil];
        [alertView show];
        
        NSLog(@"No reachability");
        return NO;
    }
    return YES;
    
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"ViewController:SetUpSharedStuff");
    NSString* audioString = [[NSBundle mainBundle] pathForResource:@"Bellz" ofType:@"caf"];
    
    NSString* expandedPath = [audioString stringByExpandingTildeInPath];
    NSURL* audioUrl = [NSURL fileURLWithPath:expandedPath];
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"Mute"])
    {
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:nil];
        [player setDelegate:self];
        [self.player play];
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    self.player=nil;
}

    
- (void)viewDidUnload
{
    NSLog(@"ViewController:viewDidUnload");
    [super viewDidUnload];
    
}


@end
