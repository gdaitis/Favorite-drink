//
//  Favorite_DrinkViewController.h
//  Favorite Drink
//
//  Created by Vytautas on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Favorite_DrinkAppDelegate;
@class ResultsViewController;

@interface Favorite_DrinkViewController : UIViewController <UIAlertViewDelegate>
{
    Favorite_DrinkAppDelegate *appDelegate;
    ResultsViewController *resultsViewController;
    NSMutableDictionary *data;
    UIAlertView *sultysAlert;
    UIAlertView *sidrasAlert;
    UIAlertView *alusAlert;
    UIAlertView *vynasAlert;
    UIAlertView *putojantisAlert;
    UIAlertView *vodkaAlert;
    UIButton *splashView;
}

@property (nonatomic, retain) Favorite_DrinkAppDelegate *appDelegate;
@property (nonatomic, retain) ResultsViewController *resultsViewController;
@property (nonatomic, retain) NSMutableDictionary *data;
@property (nonatomic, retain) UIAlertView *sultysAlert;
@property (nonatomic, retain) UIAlertView *sidrasAlert;
@property (nonatomic, retain) UIAlertView *alusAlert;
@property (nonatomic, retain) UIAlertView *vynasAlert;
@property (nonatomic, retain) UIAlertView *putojantisAlert;
@property (nonatomic, retain) UIAlertView *vodkaAlert;
@property (nonatomic, retain) UIButton *splashView;

- (void)sultysPressed;
- (void)sidrasPressed;
- (void)alusPressed;
- (void)vynasPressed;
- (void)putojantisPressed;
- (void)vodkaPressed;
- (void)showResultsView;
- (void)infoPressed;
- (void)splashPressed;

@end
