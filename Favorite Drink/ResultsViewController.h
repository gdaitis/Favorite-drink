//
//  ResultsViewController.h
//  Favorite Drink
//
//  Created by Vytautas on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Favorite_DrinkViewController;

@interface ResultsViewController : UIViewController <UIAlertViewDelegate>
{
    Favorite_DrinkViewController *parent;
    UIImageView *sultysBar;
    UIImageView *sidrasBar;
    UIImageView *alusBar;
    UIImageView *vynasBar;
    UIImageView *putojantisBar;
    UIImageView *vodkaBar;
    IBOutlet UILabel *winnerLabel;
    UIButton *resetButton;
    UIAlertView *resetAlert;
    UILabel *sultysLabel;
    UILabel *sidrasLabel;
    UILabel *alusLabel;
    UILabel *vynasLabel;
    UILabel *putojantisLabel;
    UILabel *vodkaLabel;
    UIImageView *patamsejimas;
    UIImageView *sultys;
    UIImageView *sidras;
    UIImageView *alus;
    UIImageView *vynas;
    UIImageView *putojantis;
    UIImageView *vodka;
    UIButton *backButton;
    UIImageView *tekstas;
}

@property (nonatomic, retain) Favorite_DrinkViewController *parent;
@property (nonatomic, retain) UIImageView *sultysBar;
@property (nonatomic, retain) UIImageView *sidrasBar;
@property (nonatomic, retain) UIImageView *alusBar;
@property (nonatomic, retain) UIImageView *vynasBar;
@property (nonatomic, retain) UIImageView *putojantisBar;
@property (nonatomic, retain) UIImageView *vodkaBar;
@property (nonatomic, retain) IBOutlet UILabel *winnerLabel;
@property (nonatomic, retain) UIButton *resetButton;
@property (nonatomic, retain) UIAlertView *resetAlert;
@property (nonatomic, retain) UILabel *sultysLabel;
@property (nonatomic, retain) UILabel *sidrasLabel;
@property (nonatomic, retain) UILabel *alusLabel;
@property (nonatomic, retain) UILabel *vynasLabel;
@property (nonatomic, retain) UILabel *putojantisLabel;
@property (nonatomic, retain) UILabel *vodkaLabel;
@property (nonatomic, retain) UIImageView *patamsejimas;
@property (nonatomic, retain) UIImageView *sultys;
@property (nonatomic, retain) UIImageView *sidras;
@property (nonatomic, retain) UIImageView *alus;
@property (nonatomic, retain) UIImageView *vynas;
@property (nonatomic, retain) UIImageView *putojantis;
@property (nonatomic, retain) UIImageView *vodka;
@property (nonatomic, retain) UIButton *backButton;
@property (nonatomic, retain) UIImageView *tekstas;

- (UIImage*)imageByCropping:(UIImage *)imageToCrop toPercents:(NSInteger)percents;
- (void)back;
- (void)reset;

@end
