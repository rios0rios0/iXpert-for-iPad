//
//  OptionViewController.m
//  iXpert for iPad
//
//  Created by Felipe Rios on 11/03/12.
//  Copyright (c) 2012 FreeDeveloping. All rights reserved.
//

#import "OptionViewController.h"
#import "HowtoViewController.h"
#import "RatingSystem.h"
#import "Hashes.h"

#define forHex @"ABCDEFabcdef0123456789"
#define forOct @"0123456789"
#define forBin @"0123456789"

@implementation OptionViewController
@synthesize NSStringOption, UIButtonEnc, UIButtonDec, UIButtonHex, UIButtonHex2, UIButtonBin, UIButtonBin2, UIButtonOct, UIButtonRev, UIButtonLoo, UIButtonB64, UIButtonMD5, UITextViewIn, UITextViewOut;

- (void)CheckBoxEfect:(UIButton *)In {
    for (int i = [self.view.subviews count] -1; i >= 0; i--) {
        if ([[self.view.subviews objectAtIndex: i] isKindOfClass:[UIButton class]]) {
            [[self.view.subviews objectAtIndex: i] setSelected: NO];
        }
    }
    [In setSelected: YES];
}

- (IBAction)More:(id)sender {
    UIActionSheet *As = [[UIActionSheet alloc] initWithTitle: @"More and Info" delegate: self cancelButtonTitle: nil destructiveButtonTitle: nil otherButtonTitles: @"More Apps", @"How to Use This App", @"About This App", nil];
    [As showInView: self.view];
    [As release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // MY APPLE ITUNES CHANNEL
    } else if (buttonIndex == 1) {
        HowtoViewController *howtoViewController = [[HowtoViewController alloc] init];
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController: howtoViewController];
        [popover setDelegate: self];
        [popover presentPopoverFromRect: CGRectMake(223, -75, 320, 460) inView: self.view permittedArrowDirections: UIPopoverArrowDirectionUp animated: YES];
        [popover setPopoverContentSize: CGSizeMake(320, 460)];
        [howtoViewController release];
    } else if (buttonIndex == 2) {
        UIAlertView *AV = [[UIAlertView alloc] initWithTitle: @"INFO (About)" message: @"iXpert Conversor (for iPad) v1.0 \nCreated By: Felipe Rios. \nCopyright © 2012 Free Developing, \nAll Rights Reserved. \nContact: \n*E-mail: free.developing.2012@hotmail.com \n*Twitter: @FDeveloping" delegate: self cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [AV show];
        [AV release];
    }
}

#pragma mark Changing processors cicle

- (IBAction)ChangeProcessor:(id)sender {
    if (sender == UIButtonHex) {
        NSStringOption = @"Hex";
        UIButtonDec.hidden = NO;
        [self CheckBoxEfect: UIButtonHex];
        UITextViewIn.text = @"";
        UITextViewOut.text = @"";
    } else if (sender == UIButtonHex2) {
        NSStringOption = @"Hex2";
        UIButtonDec.hidden = NO;
        [self CheckBoxEfect: UIButtonHex2];
        UITextViewIn.text = @"";
        UITextViewOut.text = @"";
    } else if (sender == UIButtonBin) {
        NSStringOption = @"Bin";
        UIButtonDec.hidden = NO;
        [self CheckBoxEfect: UIButtonBin];
        UITextViewIn.text = @"";
        UITextViewOut.text = @"";
    } else if (sender == UIButtonBin2) {
        NSStringOption = @"Bin2";
        UIButtonDec.hidden = NO;
        [self CheckBoxEfect: UIButtonBin2];
        UITextViewIn.text = @"";
        UITextViewOut.text = @"";
    } else if (sender == UIButtonOct) {
        NSStringOption = @"Oct";
        UIButtonDec.hidden = NO;
        [self CheckBoxEfect: UIButtonOct];
        UITextViewIn.text = @"";
        UITextViewOut.text = @"";
    } else if (sender == UIButtonRev) {
        NSStringOption = @"Rev";
        UIButtonDec.hidden = YES;
        [self CheckBoxEfect: UIButtonRev];
        UITextViewIn.text = @"";
        UITextViewOut.text = @"";
    } else if (sender == UIButtonLoo) {
        NSStringOption = @"Loo";
        UIButtonDec.hidden = NO;
        [self CheckBoxEfect: UIButtonLoo];
        UITextViewIn.text = @"";
        UITextViewOut.text = @"";
    } else if (sender == UIButtonB64) {
        NSStringOption = @"B64";
        UIButtonDec.hidden = NO;
        [self CheckBoxEfect: UIButtonB64];
        UITextViewIn.text = @"";
        UITextViewOut.text = @"";
    } else if (sender == UIButtonMD5) {
        NSStringOption = @"MD5";
        UIButtonDec.hidden = YES;
        [self CheckBoxEfect: UIButtonMD5];
        UITextViewIn.text = @"";
        UITextViewOut.text = @"";
    }
}

#pragma mark TextView Delegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([NSStringOption isEqualToString: @"Hex2"]) {
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString: forHex] invertedSet];
        NSString *filtered = [[text componentsSeparatedByCharactersInSet: cs] componentsJoinedByString: @""];
        return [text isEqualToString: filtered];
    } else if ([NSStringOption isEqualToString: @"Bin2"]) {
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString: forBin] invertedSet];
        NSString *filtered = [[text componentsSeparatedByCharactersInSet: cs] componentsJoinedByString: @""];
        return [text isEqualToString: filtered];
    } else if ([NSStringOption isEqualToString: @"Oct"]) {
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString: forOct] invertedSet];
        NSString *filtered = [[text componentsSeparatedByCharactersInSet: cs] componentsJoinedByString: @""];
        return [text isEqualToString: filtered];
    } else {
        return YES;
    }
}

#pragma mark Encoding and Decoding cicle

- (IBAction)Process:(id)sender {
    if ([NSStringOption isEqualToString: @""]) {
        return;
    }
    if (sender == UIButtonEnc) {
        if ([NSStringOption isEqualToString: @"Hex"]) {
            UITextViewOut.text = [RatingSystem ASCIItoHex: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"Hex2"]) {
            UITextViewOut.text = [RatingSystem DectoHex: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"Bin"]) {
            UITextViewOut.text = [RatingSystem ASCIItoBin: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"Bin2"]) {
            UITextViewOut.text = [RatingSystem DectoBin: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"Oct"]) {
            UITextViewOut.text = [RatingSystem DectoOct: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"Rev"]) {
            UITextViewOut.text = [RatingSystem ReverASCII: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"Loo"]) {
            UITextViewOut.text = [RatingSystem ASCIItoLoo: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"B64"]) {
            UITextViewOut.text = [Hashes EncodeB64: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"MD5"]) {
            UITextViewOut.text = [Hashes EncodeMD5: UITextViewIn.text];
        }
    } else {
        if ([NSStringOption isEqualToString: @"Hex"]) {
            UITextViewOut.text = [RatingSystem HextoASCII: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"Hex2"]) {
            UITextViewOut.text = [RatingSystem HextoDec: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"Bin"]) {
            UITextViewOut.text = [RatingSystem BintoASCII: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"Bin2"]) {
            UITextViewOut.text = [RatingSystem BintoDec: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"Oct"]) {
            UITextViewOut.text = [RatingSystem OcttoDec: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"Loo"]) {
            UITextViewOut.text = [RatingSystem LootoASCII: UITextViewIn.text];
        } else if ([NSStringOption isEqualToString: @"B64"]) {
            UITextViewOut.text = [Hashes DecodeB64: [UITextViewIn.text cStringUsingEncoding: NSASCIIStringEncoding] length: UITextViewIn.text.length];
        }
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    NSStringOption = nil;
    UIButtonEnc = nil;
    UIButtonDec = nil;
    UIButtonHex = nil;
    UIButtonHex2 = nil;
    UIButtonBin = nil;
    UIButtonBin2 = nil;
    UIButtonOct = nil;
    UIButtonRev = nil;
    UIButtonLoo = nil;
    UIButtonB64 = nil;
    UIButtonMD5 = nil;
    UITextViewIn = nil;
    UITextViewOut = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [NSStringOption release];
    [UIButtonEnc release];
    [UIButtonDec release];
    [UIButtonHex release];
    [UIButtonHex2 release];
    [UIButtonBin release];
    [UIButtonBin2 release];
    [UIButtonOct release];
    [UIButtonRev release];
    [UIButtonLoo release];
    [UIButtonB64 release];
    [UIButtonMD5 release];
    [UITextViewIn release];
    [UITextViewOut release];
    [super dealloc];
}

@end

