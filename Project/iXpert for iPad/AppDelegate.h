//
//  AppDelegate.h
//  iXpert for iPad
//
//  Created by Felipe Rios on 11/03/12.
//  Copyright (c) 2012 FreeDeveloping. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    MasterViewController *masterViewController;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MasterViewController *masterViewController;

@end