//
//  MasterViewController.m
//  iXpert for iPad
//
//  Created by Felipe Rios on 11/03/12.
//  Copyright (c) 2012 FreeDeveloping. All rights reserved.
//

#import "MasterViewController.h"
#import "OptionViewController.h"

@implementation MasterViewController
@synthesize optionViewController;

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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    OptionViewController *optionController = [[OptionViewController alloc] initWithNibName: @"OptionViewController" bundle: nil];
    self.optionViewController = optionController;
    [self.view insertSubview: optionController.view atIndex: 0];
    [optionController release];
}

- (void)viewDidUnload
{
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
    [optionViewController release];
    [super dealloc];
}

@end

