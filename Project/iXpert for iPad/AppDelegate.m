//
//  AppDelegate.m
//  iXpert for iPad
//
//  Created by Felipe Rios on 11/03/12.
//  Copyright (c) 2012 FreeDeveloping. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"

@implementation AppDelegate
@synthesize window, masterViewController;

- (void)dealloc
{
    [masterViewController release];
    [window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.window addSubview: masterViewController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
