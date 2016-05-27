//  UVIViewController.h
//  SwiftObjective
//
//  Created by Vignesh on 5/27/16.
//  Copyright © 2016 vigneshuvi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UVIDataRefreshProtocol.h"

static NSString *const DataRefreshNotification = @"Uvi Data refreshed";

@interface UVIViewController : UIViewController

- (void) registerForBasicDataRefreshNotification;
- (void) removeBasicDataRefreshObserver;
- (void) validateBasicDataRefreshNotification;

@end
