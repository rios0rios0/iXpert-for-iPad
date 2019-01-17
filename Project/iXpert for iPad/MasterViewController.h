//
//  MasterViewController.h
//  iXpert for iPad
//
//  Created by Felipe Rios on 11/03/12.
//  Copyright (c) 2012 FreeDeveloping. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionViewController.h"

@interface MasterViewController : UIViewController {
    OptionViewController *optionViewController;
}

@property (nonatomic, retain) OptionViewController *optionViewController;

@end