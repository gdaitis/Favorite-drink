//
//  KokteiliaiViewController.h
//  Kokteiliai
//
//  Created by Vytautas on 3/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KokteiliaiViewController : UIViewController <UIScrollViewDelegate>
{
	NSArray *contentList;
	UIScrollView *scrollView;
    NSMutableArray *viewControllers;
    
    // To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;
}

@property (nonatomic, retain) NSArray *contentList;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NSMutableArray *viewControllers;

- (void)loadScrollViewWithPage:(int)page;

@end

