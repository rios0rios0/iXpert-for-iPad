//
//  OptionViewController.h
//  iXpert for iPad
//
//  Created by Felipe Rios on 11/03/12.
//  Copyright (c) 2012 FreeDeveloping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionViewController : UIViewController <UIActionSheetDelegate, UIPopoverControllerDelegate> {
    NSString *NSStringOption;
    UIButton *UIButtonEnc;
    UIButton *UIButtonDec;
    UIButton *UIButtonHex;
    UIButton *UIButtonHex2;
    UIButton *UIButtonBin;
    UIButton *UIButtonBin2;
    UIButton *UIButtonOct;
    UIButton *UIButtonRev;
    UIButton *UIButtonLoo;
    UIButton *UIButtonB64;
    UIButton *UIButtonMD5;
    UITextView *UITextViewIn;
    UITextView *UITextViewOut;
}    

@property (nonatomic, retain) NSString *NSStringOption;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonEnc;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonDec;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonHex;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonHex2;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonBin;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonBin2;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonOct;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonRev;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonLoo;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonB64;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonMD5;
@property (nonatomic, retain) IBOutlet UITextView *UITextViewIn;
@property (nonatomic, retain) IBOutlet UITextView *UITextViewOut;

- (IBAction)More:(id)sender;
- (IBAction)Process:(id)sender;
- (IBAction)ChangeProcessor:(id)sender;

@end

