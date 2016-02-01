//
//  Favorite_DrinkAppDelegate.h
//  Favorite Drink
//
//  Created by Vytautas on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Favorite_DrinkViewController;

@interface Favorite_DrinkAppDelegate : NSObject <UIApplicationDelegate> 
{

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Favorite_DrinkViewController *viewController;

@end
