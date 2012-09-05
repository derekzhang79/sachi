//
//  SubscriptionAlertView.m
//  ChimpKit2
//
//  Created by Amro Mousa on 4/6/11.
//  Copyright 2011 MailChimp. All rights reserved.
//

#import "SubscribeAlertView.h"
#import "ChimpKit.h"

@interface SubscribeAlertView()
@property (nonatomic, retain) ChimpKit *chimpKit;
@property (nonatomic, retain) NSString *listId;
@end

@implementation SubscribeAlertView

@synthesize textField, chimpKit, listId;

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
             apiKey:(NSString *)apiKey
             listId:(NSString *)aListId
  cancelButtonTitle:(NSString *)cancelButtonTitle
subscribeButtonTitle:(NSString *)subscribeButtonTitle {
    
	self = [super initWithTitle:title
                        message:message
                       delegate:nil
              cancelButtonTitle:cancelButtonTitle
              otherButtonTitles:subscribeButtonTitle, nil];
    if (self) {
        //Set the delegate to self so we can handle button presses
        self.delegate = self;
        
		if ([self respondsToSelector:@selector(setAlertViewStyle:)]) {
			self.alertViewStyle = UIAlertViewStylePlainTextInput;
            
			self.textField = [self textFieldAtIndex:0];
		} else {
			UITextField *aTextField = [[UITextField alloc] initWithFrame:CGRectZero];
			aTextField.borderStyle = UITextBorderStyleRoundedRect;
			aTextField.delegate = self;
			
			self.textField = aTextField;
			
			[self addSubview:self.textField];
		}
		
		// Common text field properties
		self.textField.placeholder = @"Email Address";
		self.textField.keyboardType = UIKeyboardTypeEmailAddress;
		self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
		self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        self.listId = aListId;
        
        ChimpKit *cKit = [[ChimpKit alloc] initWithDelegate:self andApiKey:apiKey];
        self.chimpKit = cKit;
        
        //ChimpKit expects self to be around (since it's the delegate!) 
        //so retain ourselves just in case
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	if (![self respondsToSelector:@selector(setAlertViewStyle:)]) {
		CGRect lowestRect = CGRectZero;
		for (UIView *view in self.subviews) {
			//Find the lowest view's rect so we can position the textField later
			if ([view isKindOfClass:[UILabel class]] && (view.frame.origin.y >= lowestRect.origin.y)) {
				lowestRect = view.frame;
			}
            
			//Shift the buttons down (they're instances of a private class so we can't reference it by name)
			if (![view isKindOfClass:[UITextField class]] && ![view isKindOfClass:[UILabel class]] && ![view isKindOfClass:[UIImageView class]]) {
				view.frame = CGRectMake(CGRectGetMinX(view.frame),
										CGRectGetMinY(view.frame) + kSubscriptionAlertViewTextFieldHeight,
										CGRectGetWidth(view.frame),
										CGRectGetHeight(view.frame));
			}
		}
		
		//Position the text field based on the lowest view's rect, which we found earlier
		self.textField.frame = CGRectMake(CGRectGetMinX(lowestRect),
										  CGRectGetMaxY(lowestRect) + kSubscriptionAlertViewTextFieldYPadding,
										  CGRectGetWidth(lowestRect),
										  kSubscriptionAlertViewTextFieldHeight);
		
		//Adjust the size of the entire view to account for the height of the text field
		self.frame = CGRectMake(CGRectGetMinX(self.frame), 
								CGRectGetMinY(self.frame), 
								CGRectGetWidth(self.frame), 
								CGRectGetHeight(self.frame) + kSubscriptionAlertViewTextFieldHeight + kSubscriptionAlertViewTextFieldYPadding);
	}
}

- (void) show {
    NSLog(@"SubscribeAlertView:show");
	[super show];
	[self.textField becomeFirstResponder];
}



#pragma mark - ChimpKit Delegate Methods

- (void)requestCompleted:(ChimpKit *)request {
    NSString *response = [request responseString];
    if (![response isEqualToString:@"true"]) {
        UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Subscription Failed"
                                                                 message:@"Unable to subscribe your email address. Please check it and try again."
                                                                delegate:nil 
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil];
		[errorAlertView show];
    }
    
    //Release self since we retained self in init and self's work is now done.
}

#pragma mark - <UIAlertViewDelegate> Methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) { // Subscribe pressed
        
        if([self validEmail:self.textField.text])
        {
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            NSMutableDictionary *mergeVars = [NSMutableDictionary dictionary];
            
            NSMutableArray *grouping=[NSMutableArray array];
            NSMutableDictionary *groupSettings= [NSMutableDictionary dictionary];
            [groupSettings setValue:@"Happy Sachi Umbrella Group" forKey:@"name"];
            [groupSettings setValue:@"iOS Signup Emails" forKey:@"groups"];
            [grouping addObject:groupSettings];
            
            [mergeVars setValue:@"Happy Sachi" forKey:@"FNAME"];
            [mergeVars setValue:@"iOS User" forKey:@"LNAME"];
            [mergeVars setValue:grouping forKey:@"GROUPINGS"];
            
            
            
            
            [params setValue:self.listId forKey:@"id"];
            [params setValue:self.textField.text forKey:@"email_address"];
            [params setValue:@"false" forKey:@"double_optin"];
            [params setValue:mergeVars forKey:@"merge_vars"];
            
            [self.chimpKit callApiMethod:@"listSubscribe" withParams:params];
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setObject:@"yes" forKey:@"enteredAddress"];
            
        }
        
        
    }
}

-(BOOL) validEmail:(NSString*) emailString {
    
    NSString *regExPattern = @"^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    NSLog(@"%i", regExMatches);
    
    
    
    if (regExMatches == 0) {
        NSLog(@"Invalid Email");
        return NO;
    } else{
        NSLog(@"Valid Email");
        return YES;
    }
}


#pragma mark - <UITextFieldDelegate> Methods

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField {
    [aTextField resignFirstResponder];
	return NO;
}

@end
