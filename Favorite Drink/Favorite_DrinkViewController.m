//
//  Favorite_DrinkViewController.m
//  Favorite Drink
//
//  Created by Vytautas on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Favorite_DrinkViewController.h"
#import "Favorite_DrinkAppDelegate.h"
#import "ResultsViewController.h"
#import <AVFoundation/AVFoundation.h>

#define degreesToRadian(x) (M_PI * x / 180.0)

@implementation Favorite_DrinkViewController

@synthesize appDelegate, resultsViewController, data, sultysAlert, sidrasAlert, alusAlert, vynasAlert, putojantisAlert, vodkaAlert, splashView;

- (void)dealloc
{
    [super dealloc];
    [resultsViewController release];
    [data release];
    [sultysAlert release];
    [sidrasAlert release];
    [alusAlert release];
    [vynasAlert release];
    [putojantisAlert release];
    [vodkaAlert release];
    [splashView release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    UIButton *sultysButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sultysButton.frame = CGRectMake(0, 0, 341, 384);
    [sultysButton setBackgroundImage:[UIImage imageNamed:@"sultys.png"] forState:UIControlStateNormal];
    [sultysButton addTarget:self action:@selector(sultysPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sultysButton];
    
    UIButton *sidrasButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sidrasButton.frame = CGRectMake(314, 0, 342, 384);
    [sidrasButton setBackgroundImage:[UIImage imageNamed:@"sidras.png"] forState:UIControlStateNormal];
    [sidrasButton addTarget:self action:@selector(sidrasPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sidrasButton];
    
    UIButton *alusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    alusButton.frame = CGRectMake(683, 0, 343, 384);
    [alusButton setBackgroundImage:[UIImage imageNamed:@"alus.png"] forState:UIControlStateNormal];
    [alusButton addTarget:self action:@selector(alusPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alusButton];
    
    UIButton *vynasButton = [UIButton buttonWithType:UIButtonTypeCustom];
    vynasButton.frame = CGRectMake(0, 384, 341, 384);
    [vynasButton setBackgroundImage:[UIImage imageNamed:@"vynas.png"] forState:UIControlStateNormal];
    [vynasButton addTarget:self action:@selector(vynasPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vynasButton];
    
    UIButton *putojantisButton = [UIButton buttonWithType:UIButtonTypeCustom];
    putojantisButton.frame = CGRectMake(314, 384, 342, 384);
    [putojantisButton setBackgroundImage:[UIImage imageNamed:@"putojantis.png"] forState:UIControlStateNormal];
    [putojantisButton addTarget:self action:@selector(putojantisPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:putojantisButton];
    
    UIButton *vodkaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    vodkaButton.frame = CGRectMake(683, 384, 343, 384);
    [vodkaButton setBackgroundImage:[UIImage imageNamed:@"vodka.png"] forState:UIControlStateNormal];
    [vodkaButton addTarget:self action:@selector(vodkaPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vodkaButton];
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    infoButton.frame = CGRectMake(986, 709, 18, 19);
    [infoButton addTarget:self action:@selector(infoPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoButton];
    [self.view bringSubviewToFront:infoButton];
    
    // Set up the data
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    self.data = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    if ([self.data count] == 0) 
    {
        self.data = [NSMutableDictionary dictionary];
        [self.data setObject:[NSNumber numberWithInt:0] forKey:@"sultys"];
        [self.data setObject:[NSNumber numberWithInt:0] forKey:@"sidras"];
        [self.data setObject:[NSNumber numberWithInt:0] forKey:@"alus"];
        [self.data setObject:[NSNumber numberWithInt:0] forKey:@"vynas"];
        [self.data setObject:[NSNumber numberWithInt:0] forKey:@"putojantis_vynas"];
        [self.data setObject:[NSNumber numberWithInt:0] forKey:@"vodka"];
        [self.data writeToFile:path atomically:NO];
    }
    
    // Splash view
    self.splashView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.splashView.frame = CGRectMake(0, 0, 1024, 768);
    [self.splashView addTarget:self action:@selector(splashPressed) forControlEvents:UIControlEventTouchUpInside];
    self.splashView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splash.png"]];
    [self.view addSubview:self.splashView];
    [self.view bringSubviewToFront:self.splashView];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.splashView.alpha = 1.0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
		return YES;
	else
		return NO;
}

#pragma mark - My methods

- (void)sultysPressed
{
    self.sultysAlert = [[UIAlertView alloc] initWithTitle:@"Dėmesio"
                                                  message:@"Ar tai paskutinis jūsų pasirinkimas?"
                                                 delegate:self
                                        cancelButtonTitle:@"Taip" 
                                        otherButtonTitles:@"Ne", nil];
    [self.sultysAlert show];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pressed" ofType:@"wav"];  
	AVAudioPlayer *theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];  
	[theAudio play];
}

- (void)sidrasPressed
{
    self.sidrasAlert = [[UIAlertView alloc] initWithTitle:@"Dėmesio"
                                                  message:@"Ar tai paskutinis jūsų pasirinkimas?"
                                                 delegate:self
                                        cancelButtonTitle:@"Taip" 
                                        otherButtonTitles:@"Ne", nil];
    [self.sidrasAlert show];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pressed" ofType:@"wav"];  
	AVAudioPlayer *theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];  
	[theAudio play];
}

- (void)alusPressed
{
    self.alusAlert = [[UIAlertView alloc] initWithTitle:@"Dėmesio"
                                                  message:@"Ar tai paskutinis jūsų pasirinkimas?"
                                                 delegate:self
                                        cancelButtonTitle:@"Taip" 
                                        otherButtonTitles:@"Ne", nil];
    [self.alusAlert show];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pressed" ofType:@"wav"];  
	AVAudioPlayer *theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];  
	[theAudio play];
}

- (void)vynasPressed
{
    self.vynasAlert = [[UIAlertView alloc] initWithTitle:@"Dėmesio"
                                                  message:@"Ar tai paskutinis jūsų pasirinkimas?"
                                                 delegate:self
                                        cancelButtonTitle:@"Taip" 
                                        otherButtonTitles:@"Ne", nil];
    [self.vynasAlert show];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pressed" ofType:@"wav"];  
	AVAudioPlayer *theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];  
	[theAudio play];
}

- (void)putojantisPressed
{
    self.putojantisAlert = [[UIAlertView alloc] initWithTitle:@"Dėmesio"
                                                  message:@"Ar tai paskutinis jūsų pasirinkimas?"
                                                 delegate:self
                                        cancelButtonTitle:@"Taip" 
                                        otherButtonTitles:@"Ne", nil];
    [self.putojantisAlert show];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pressed" ofType:@"wav"];  
	AVAudioPlayer *theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];  
	[theAudio play];
}

- (void)vodkaPressed
{
    self.vodkaAlert = [[UIAlertView alloc] initWithTitle:@"Dėmesio"
                                                  message:@"Ar tai paskutinis jūsų pasirinkimas?"
                                                 delegate:self
                                        cancelButtonTitle:@"Taip" 
                                        otherButtonTitles:@"Ne", nil];
    [self.vodkaAlert show];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pressed" ofType:@"wav"];  
	AVAudioPlayer *theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];  
	[theAudio play];
}

- (void)showResultsView
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    [self.data writeToFile:path atomically:NO];
    
    if (self.resultsViewController == nil)
    {
        self.resultsViewController = [[ResultsViewController alloc] init];
        self.resultsViewController.parent = self;
        UIScreen *screen = [UIScreen mainScreen];
        self.resultsViewController.view.bounds = CGRectMake(0, 0, screen.bounds.size.height, screen.bounds.size.width);
        self.resultsViewController.view.transform = CGAffineTransformConcat(self.resultsViewController.view.transform, CGAffineTransformMakeRotation(degreesToRadian(-90)));
        self.resultsViewController.view.center = appDelegate.window.center;
    }
    
    [self.appDelegate.window addSubview:resultsViewController.view];
    self.resultsViewController.view.alpha = 0.0;
	[UIView beginAnimations:nil context:nil];
	self.resultsViewController.view.alpha = 1.0;
	[UIView commitAnimations];
}

- (void)infoPressed
{
    if (self.resultsViewController == nil)
    {
        self.resultsViewController = [[ResultsViewController alloc] init];
        self.resultsViewController.parent = self;
        UIScreen *screen = [UIScreen mainScreen];
        self.resultsViewController.view.bounds = CGRectMake(0, 0, screen.bounds.size.height, screen.bounds.size.width);
        self.resultsViewController.view.transform = CGAffineTransformConcat(self.resultsViewController.view.transform, CGAffineTransformMakeRotation(degreesToRadian(-90)));
        self.resultsViewController.view.center = appDelegate.window.center;
    }
    
    self.resultsViewController.winnerLabel.alpha = 1.0;
    self.resultsViewController.resetButton.enabled = YES;
    
    [self.appDelegate.window addSubview:resultsViewController.view];
    self.resultsViewController.view.alpha = 0.0;
	[UIView beginAnimations:nil context:nil];
	self.resultsViewController.view.alpha = 1.0;
	[UIView commitAnimations];
}

- (void)splashPressed
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pressed" ofType:@"wav"];  
	AVAudioPlayer *theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];  
	[theAudio play];
    
    [UIView beginAnimations:nil context:nil];
    self.splashView.alpha = 0.0;
    [UIView commitAnimations];
}

#pragma mark - UIAlertView delegate methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == self.sultysAlert)
    {
        if (buttonIndex == 0)
        {
            NSInteger value = [[self.data objectForKey:@"sultys"] integerValue];
            value = value + 1;
            [self.data setObject:[NSNumber numberWithInt:value] forKey:@"sultys"];
            
            [self showResultsView];
        }
        
        if (buttonIndex == 1)
        {
            //actions
        }
    }
    if (alertView == self.sidrasAlert)
    {
        if (buttonIndex == 0)
        {
            NSInteger value = [[self.data objectForKey:@"sidras"] integerValue];
            value = value + 1;
            [self.data setObject:[NSNumber numberWithInt:value] forKey:@"sidras"];
            
            [self showResultsView];
        }
        
        if (buttonIndex == 1)
        {
            //actions
        }
    }
    if (alertView == self.alusAlert)
    {
        if (buttonIndex == 0)
        {
            NSInteger value = [[self.data objectForKey:@"alus"] integerValue];
            value = value + 1;
            [self.data setObject:[NSNumber numberWithInt:value] forKey:@"alus"];
            
            [self showResultsView];
        }
        
        if (buttonIndex == 1)
        {
            //actions
        }
    }
    if (alertView == self.vynasAlert)
    {
        if (buttonIndex == 0)
        {
            NSInteger value = [[self.data objectForKey:@"vynas"] integerValue];
            value = value + 1;
            [self.data setObject:[NSNumber numberWithInt:value] forKey:@"vynas"];
            
            [self showResultsView];
        }
        
        if (buttonIndex == 1)
        {
            //actions
        }
    }
    if (alertView == self.putojantisAlert)
    {
        if (buttonIndex == 0)
        {
            NSInteger value = [[self.data objectForKey:@"putojantis_vynas"] integerValue];
            value = value + 1;
            [self.data setObject:[NSNumber numberWithInt:value] forKey:@"putojantis_vynas"];
            
            [self showResultsView];
        }
        
        if (buttonIndex == 1)
        {
            //actions
        }
    }
    if (alertView == self.vodkaAlert)
    {
        if (buttonIndex == 0)
        {
            NSInteger value = [[self.data objectForKey:@"vodka"] integerValue];
            value = value + 1;
            [self.data setObject:[NSNumber numberWithInt:value] forKey:@"vodka"];
            
            [self showResultsView];
        }
        
        if (buttonIndex == 1)
        {
            //actions
        }
    }
}

@end
