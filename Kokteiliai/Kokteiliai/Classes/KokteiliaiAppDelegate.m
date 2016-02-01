//
//  KokteiliaiAppDelegate.m
//  Kokteiliai
//
//  Created by Vytautas on 3/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KokteiliaiAppDelegate.h"
#import "KokteiliaiViewController.h"

@implementation KokteiliaiAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{    
    // Override point for customization after app launch. 
    [self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];

	return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc 
{
    [viewController release];
    [window release];
    [super dealloc];
}


@end
