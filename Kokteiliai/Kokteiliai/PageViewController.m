    //
//  PageViewController.m
//  Kokteiliai
//
//  Created by Vytautas on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PageViewController.h"


@implementation PageViewController

@synthesize image1, image2, image3, image4, image5, image6, image7, image8, images;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.images = [NSMutableArray arrayWithObjects:image1, image2, image3, image4, image5, image6, image7, image8, nil];
}

- (id)initWithPageNumber:(int)page
{
    if (self = [super initWithNibName:@"PageViewController" bundle:nil])
    {
        pageNumber = page;
    }
    return self;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
	if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
		return YES;
	else
		return NO;
}

- (void)viewDidUnload 
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.image1 = nil;
	self.image2 = nil;
	self.image3 = nil;
	self.image4 = nil;
	self.image5 = nil;
	self.image6 = nil;
	self.image7 = nil;
	self.image8 = nil;
	self.images = nil;
}


- (void)dealloc 
{
    [super dealloc];
	[image1 release];
	[image2 release];
	[image3 release];
	[image4 release];
	[image5 release];
	[image6 release];
	[image7 release];
	[image8 release];
	[images release];
}


@end
