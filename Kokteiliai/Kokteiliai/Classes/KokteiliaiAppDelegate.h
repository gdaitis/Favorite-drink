//
//  KokteiliaiAppDelegate.h
//  Kokteiliai
//
//  Created by Vytautas on 3/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KokteiliaiViewController;

@interface KokteiliaiAppDelegate : NSObject <UIApplicationDelegate> 
{
    UIWindow *window;
    KokteiliaiViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet KokteiliaiViewController *viewController;

@end

