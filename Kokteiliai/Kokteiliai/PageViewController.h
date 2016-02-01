//
//  PageViewController.h
//  Kokteiliai
//
//  Created by Vytautas on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController 
{
	int pageNumber;
    UIImageView *image1;
    UIImageView *image2;
    UIImageView *image3;
    UIImageView *image4;
    UIImageView *image5;
    UIImageView *image6;
    UIImageView *image7;
    UIImageView *image8;
	NSMutableArray *images;
}

@property (nonatomic, retain) IBOutlet UIImageView *image1;
@property (nonatomic, retain) IBOutlet UIImageView *image2;
@property (nonatomic, retain) IBOutlet UIImageView *image3;
@property (nonatomic, retain) IBOutlet UIImageView *image4;
@property (nonatomic, retain) IBOutlet UIImageView *image5;
@property (nonatomic, retain) IBOutlet UIImageView *image6;
@property (nonatomic, retain) IBOutlet UIImageView *image7;
@property (nonatomic, retain) IBOutlet UIImageView *image8;
@property (nonatomic, retain) NSMutableArray *images;

- (id)initWithPageNumber:(int)page;

@end
