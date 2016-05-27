//  UVIViewController.m
//  SwiftObjective
//
//  Created by Vignesh on 5/27/16.
//  Copyright © 2016 vigneshuvi. All rights reserved.
//

#import "UVIViewController.h"

@interface UVIViewController ()

@end

@implementation UVIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Fix to issue that navigation bar covers view in iOS 7.0.
	self.edgesForExtendedLayout = UIRectEdgeNone;

    [self.view setBackgroundColor:[UIColor lightTextColor]];
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Orientation

- (BOOL)shouldAutorotate
{
    return YES;
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 90000
- (NSUInteger)supportedInterfaceOrientations
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
#endif
{
    return UIInterfaceOrientationMaskPortrait;
}

/**
 *  Method validates whether the object implets the required methos
 */
- (void) validateBasicDataRefreshNotification {
	
	BOOL confirmsProtocol = [self conformsToProtocol:@protocol(UVIDataRefreshProtocol)];
	NSAssert(confirmsProtocol, @"To get basic data refresh notification, object should confirms to protocol <UVIDataRefreshProtocol>");
	
	if (confirmsProtocol) {
		if (![self canPerformAction:@selector(basicDataDidRefresh) withSender:self]) {
			[NSException raise:@"Unrecognized selector" format:@"Class should implement selector <basicDataDidRefresh>"];
		}
	}
}

- (void) registerForBasicDataRefreshNotification {
	
	[self validateBasicDataRefreshNotification];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(basicDataDidRefresh)
												 name:DataRefreshNotification object:nil];

}


- (void) removeBasicDataRefreshObserver {
	
	[[NSNotificationCenter defaultCenter] removeObserver:self name:DataRefreshNotification object:nil];
}


@end
