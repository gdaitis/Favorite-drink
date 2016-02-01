//
//  ResultsViewController.m
//  Favorite Drink
//
//  Created by Vytautas on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ResultsViewController.h"
#import "Favorite_DrinkViewController.h"

#define degreesToRadian(x) (M_PI * x / 180.0)

@implementation ResultsViewController

@synthesize parent, sultysBar, sidrasBar, alusBar, vynasBar, putojantisBar, vodkaBar, winnerLabel, resetButton, resetAlert, sultysLabel, sidrasLabel, alusLabel, vynasLabel, putojantisLabel, vodkaLabel, patamsejimas, sultys, sidras, alus, vynas, putojantis, vodka, backButton, tekstas;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [parent release];
    [sultysBar release];
    [sidrasBar release];
    [alusBar release];
    [vynasBar release];
    [putojantisBar release];
    [vodkaBar release];
    [winnerLabel release];
    [resetButton release];
    [resetAlert release];
    [alusLabel release];
    [sidrasLabel release];
    [alusLabel release];
    [vynasLabel release];
    [putojantisLabel release];
    [vodkaLabel release];
    [patamsejimas release];
    [sultys release];
    [sidras release];
    [alus release];
    [vynas release];
    [putojantis release];
    [vodka release];
    [backButton release];
    [tekstas release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    self.sultys = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sultys_bar.png"]];
    self.sultys.frame = CGRectMake(6, 299, 165, 261);
    [self.view insertSubview:self.sultys atIndex:2];
    
    self.sidras = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidras_bar.png"]];
    self.sidras.frame = CGRectMake(176, 299, 165, 261);
    [self.view insertSubview:self.sidras atIndex:2];
    
    self.alus = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alus_bar.png"]];
    self.alus.frame = CGRectMake(345, 299, 165, 261);
    [self.view insertSubview:self.alus atIndex:2];
    
    self.vynas = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vynas_bar.png"]];
    self.vynas.frame = CGRectMake(515, 299, 165, 261);
    [self.view insertSubview:self.vynas atIndex:2];
    
    self.putojantis = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"putojantis_bar.png"]];
    self.putojantis.frame = CGRectMake(680, 299, 174, 261);
    [self.view insertSubview:self.putojantis atIndex:2];
    
    self.vodka = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vodka_bar.png"]];
    self.vodka.frame = CGRectMake(854, 299, 165, 261);
    [self.view insertSubview:self.vodka atIndex:2];
    
    self.tekstas = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tekstas.png"]];
    self.tekstas.frame = CGRectMake(0, 549, 1024, 107);
    [self.view insertSubview:self.tekstas atIndex:2];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(10, 692, 177, 76);
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    [self.view bringSubviewToFront:self.backButton];
    
    self.winnerLabel.alpha = 0.0;
    
    self.resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.resetButton.frame = CGRectMake(959, 683, 65, 65);
    [self.resetButton addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.resetButton];
    self.resetButton.enabled = NO;
    
    self.patamsejimas = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"patamsejimas.png"]];
    self.patamsejimas.alpha = 1.0;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSInteger biggest = 0;
    NSString *mostWanted;
    for (NSString *key in self.parent.data)
    {
        NSInteger value = [[self.parent.data objectForKey:key] integerValue];
        if (value > biggest)
        {
            biggest = value;
            mostWanted = key;
        }
    }
    if (biggest == 0)
    {
        mostWanted = [NSString stringWithFormat:@"zero"];
        self.winnerLabel.text = @"Niekas nebalsavo!";
        biggest = 1;
    }
    
    NSLog(@"most wanted: %@", mostWanted); 
    
    NSInteger percentValue = 5;
    NSInteger minPercents = 60;
    
    // Sultys
    NSInteger sultysValue = [[self.parent.data objectForKey:@"sultys"] integerValue];
    NSInteger sultysPercent = (sultysValue * 100 / biggest);
    
    self.sultysLabel = [[UILabel alloc] init];
    
    if ([mostWanted isEqualToString:@"sultys"])
    {
        if (sultysValue == 1 || sultysPercent < minPercents)
        {
            self.sultysBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.sultysLabel.frame = CGRectMake(6, y, 165, 50);
        }
        else
        {
            self.sultysBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:sultysPercent]];
            NSInteger y = 61 + (100 - sultysPercent)*percentValue;
            self.sultysLabel.frame = CGRectMake(6, y, 165, 50);
        }
        self.winnerLabel.text = @"Daugiausiai balsų surinko sultys!";
        self.sultysLabel.textColor = [UIColor whiteColor];
    }
    else
    {   
        if (sultysValue == 1 || sultysPercent < minPercents)
        {
            self.sultysBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.sultysLabel.frame = CGRectMake(6, y, 165, 50);
        }
        else
        {
            self.sultysBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:sultysPercent]];
            NSInteger y = 61 + (100 - sultysPercent)*percentValue;
            self.sultysLabel.frame = CGRectMake(6, y, 165, 50);
        }
        self.sultysLabel.textColor = [UIColor orangeColor];
    }
    self.sultysBar.frame = CGRectMake(6, 61, 165, 466);
    [self.view insertSubview:self.sultysBar atIndex:0];
    self.sultysLabel.textAlignment = UITextAlignmentCenter;
    self.sultysLabel.backgroundColor = [UIColor clearColor];
    self.sultysLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
    self.sultysLabel.text = [NSString stringWithFormat: @"%d", sultysValue];
    [self.view addSubview:sultysLabel];
    if (sultysValue == 0)
    {
        self.sultysBar.hidden = YES;
        self.sultysLabel.hidden = YES;
    }   
    
    // Sidras
    NSInteger sidrasValue = [[self.parent.data objectForKey:@"sidras"] integerValue];
    NSInteger sidrasPercent = (sidrasValue * 100 / biggest);
    
    self.sidrasLabel = [[UILabel alloc] init];
    
    if ([mostWanted isEqualToString:@"sidras"])
    {
        if (sidrasValue == 1 || sidrasPercent < minPercents)
        {
            self.sidrasBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.sidrasLabel.frame = CGRectMake(176, y, 165, 50);
        }
        else
        {
            self.sidrasBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:sidrasPercent]];
            NSInteger y = 61 + (100 - sidrasPercent)*percentValue;
            self.sidrasLabel.frame = CGRectMake(176, y, 165, 50);
        }
        self.winnerLabel.text = @"Daugiausiai balsų surinko sidras!";
        self.sidrasLabel.textColor = [UIColor whiteColor];
    }
    else
    {   
        if (sidrasValue == 1 || sidrasPercent < minPercents)
        {
            self.sidrasBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.sidrasLabel.frame = CGRectMake(176, y, 165, 50);
        }
        else
        {
            self.sidrasBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:sidrasPercent]];
            NSInteger y = 61 + (100 - sidrasPercent)*percentValue;
            self.sidrasLabel.frame = CGRectMake(176, y, 165, 50);
        }
        self.sidrasLabel.textColor = [UIColor orangeColor];
    }
    self.sidrasBar.frame = CGRectMake(176, 61, 165, 466);
    [self.view insertSubview:self.sidrasBar atIndex:0];
    self.sidrasLabel.textAlignment = UITextAlignmentCenter;
    self.sidrasLabel.backgroundColor = [UIColor clearColor];
    self.sidrasLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
    self.sidrasLabel.text = [NSString stringWithFormat: @"%d", sidrasValue];
    [self.view addSubview:sidrasLabel];
    if (sidrasValue == 0)
    {
        self.sidrasBar.hidden = YES;
        self.sidrasLabel.hidden = YES;
    }
    
    // Alus
    NSInteger alusValue = [[self.parent.data objectForKey:@"alus"] integerValue];
    NSInteger alusPercent = (alusValue * 100 / biggest);
    
    self.alusLabel = [[UILabel alloc] init];
    
    if ([mostWanted isEqualToString:@"alus"])
    {
        if (alusValue == 1 || alusPercent < minPercents)
        {
            self.alusBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.alusLabel.frame = CGRectMake(345, y, 165, 50);
        }
        else
        {
            self.alusBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:alusPercent]];
            NSInteger y = 61 + (100 - alusPercent)*percentValue;
            self.alusLabel.frame = CGRectMake(345, y, 165, 50);
        }
        self.winnerLabel.text = @"Daugiausiai balsų surinko alus!";
        self.alusLabel.textColor = [UIColor whiteColor];
    }
    else
    {   
        if (alusValue == 1 || alusPercent < minPercents)
        {
            self.alusBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.alusLabel.frame = CGRectMake(345, y, 165, 50);
        }
        else
        {
            self.alusBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:alusPercent]];
            NSInteger y = 61 + (100 - alusPercent)*percentValue;
            self.alusLabel.frame = CGRectMake(345, y, 165, 50);
        }
        self.alusLabel.textColor = [UIColor orangeColor];
    }
    self.alusBar.frame = CGRectMake(345, 61, 165, 466);
    [self.view insertSubview:self.alusBar atIndex:0];
    self.alusLabel.textAlignment = UITextAlignmentCenter;
    self.alusLabel.backgroundColor = [UIColor clearColor];
    self.alusLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
    self.alusLabel.text = [NSString stringWithFormat: @"%d", alusValue];
    [self.view addSubview:alusLabel];
    if (alusValue == 0)
    {
        self.alusBar.hidden = YES;
        self.alusLabel.hidden = YES;
    }
    
    // Vynas
    NSInteger vynasValue = [[self.parent.data objectForKey:@"vynas"] integerValue];
    NSInteger vynasPercent = (vynasValue * 100 / biggest);
    
    self.vynasLabel = [[UILabel alloc] init];
    
    if ([mostWanted isEqualToString:@"vynas"])
    {
        if (vynasValue == 1 || vynasPercent < minPercents)
        {
            self.vynasBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.vynasLabel.frame = CGRectMake(515, y, 165, 50);
        }
        else
        {
            self.vynasBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:vynasPercent]];
            NSInteger y = 61 + (100 - vynasPercent)*percentValue;
            self.vynasLabel.frame = CGRectMake(515, y, 165, 50);
        }
        self.winnerLabel.text = @"Daugiausiai balsų surinko vynas!";
        self.vynasLabel.textColor = [UIColor whiteColor];
    }
    else
    {   
        if (vynasValue == 1 || vynasPercent < minPercents)
        {
            self.vynasBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.vynasLabel.frame = CGRectMake(515, y, 165, 50);
        }
        else
        {
            self.vynasBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:vynasPercent]];
            NSInteger y = 61 + (100 - vynasPercent)*percentValue;
            self.vynasLabel.frame = CGRectMake(515, y, 165, 50);
        }
        self.vynasLabel.textColor = [UIColor orangeColor];
    }
    self.vynasBar.frame = CGRectMake(515, 61, 165, 466);
    [self.view insertSubview:self.vynasBar atIndex:0];
    self.vynasLabel.textAlignment = UITextAlignmentCenter;
    self.vynasLabel.backgroundColor = [UIColor clearColor];
    self.vynasLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
    self.vynasLabel.text = [NSString stringWithFormat: @"%d", vynasValue];
    [self.view addSubview:vynasLabel];
    if (vynasValue == 0)
    {
        self.vynasBar.hidden = YES;
        self.vynasLabel.hidden = YES;
    }
    
    // Putojantis Vynas
    NSInteger putojantisValue = [[self.parent.data objectForKey:@"putojantis_vynas"] integerValue];
    NSInteger putojantisPercent = (putojantisValue * 100 / biggest);
    
    self.putojantisLabel = [[UILabel alloc] init];
    
    if ([mostWanted isEqualToString:@"putojantis_vynas"])
    {
        if (putojantisValue == 1 || putojantisPercent < minPercents)
        {
            self.putojantisBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.putojantisLabel.frame = CGRectMake(684, y, 165, 50);
        }
        else
        {
            self.putojantisBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:putojantisPercent]];
            NSInteger y = 61 + (100 - putojantisPercent)*percentValue;
            self.putojantisLabel.frame = CGRectMake(684, y, 165, 50);
        }
        self.winnerLabel.text = @"Daugiausiai balsų surinko šampanas!";
        self.putojantisLabel.textColor = [UIColor whiteColor];
    }
    else
    {   
        if (putojantisValue == 1 || putojantisPercent < minPercents)
        {
            self.putojantisBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.putojantisLabel.frame = CGRectMake(684, y, 165, 50);
        }
        else
        {
            self.putojantisBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:putojantisPercent]];
            NSInteger y = 61 + (100 - putojantisPercent)*percentValue;
            self.putojantisLabel.frame = CGRectMake(684, y, 165, 50);
        }
        self.putojantisLabel.textColor = [UIColor orangeColor];
    }
    self.putojantisBar.frame = CGRectMake(684, 61, 165, 466);
    [self.view insertSubview:self.putojantisBar atIndex:0];
    self.putojantisLabel.textAlignment = UITextAlignmentCenter;
    self.putojantisLabel.backgroundColor = [UIColor clearColor];
    self.putojantisLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
    self.putojantisLabel.text = [NSString stringWithFormat: @"%d", putojantisValue];
    [self.view addSubview:putojantisLabel];
    if (putojantisValue == 0)
    {
        self.putojantisBar.hidden = YES;
        self.putojantisLabel.hidden = YES;
    }
    
    // Vodka
    NSInteger vodkaValue = [[self.parent.data objectForKey:@"vodka"] integerValue];
    NSInteger vodkaPercent = (vodkaValue * 100 / biggest);
    
    self.vodkaLabel = [[UILabel alloc] init];
    
    if ([mostWanted isEqualToString:@"vodka"])
    {
        if (vodkaValue == 1 || vodkaPercent < minPercents)
        {
            self.vodkaBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.vodkaLabel.frame = CGRectMake(854, y, 165, 50);
        }
        else
        {
            self.vodkaBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"orange_bar.png"] toPercents:vodkaPercent]];
            NSInteger y = 61 + (100 - vodkaPercent)*percentValue;
            self.vodkaLabel.frame = CGRectMake(854, y, 165, 50);
        }
        self.winnerLabel.text = @"Daugiausiai balsų surinko vodka!";
        self.vodkaLabel.textColor = [UIColor whiteColor];
    }
    else
    {   
        if (vodkaValue == 1 || vodkaPercent < minPercents)
        {
            self.vodkaBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:minPercents]];
            NSInteger y = 61 + (100 - minPercents)*percentValue;
            self.vodkaLabel.frame = CGRectMake(854, y, 165, 50);
        }
        else
        {
            self.vodkaBar = [[UIImageView alloc] initWithImage:[self imageByCropping:[UIImage imageNamed:@"white_bar.png"] toPercents:vodkaPercent]];
            NSInteger y = 61 + (100 - vodkaPercent)*percentValue;
            self.vodkaLabel.frame = CGRectMake(854, y, 165, 50);
        }
        self.vodkaLabel.textColor = [UIColor orangeColor];
    }
    self.vodkaBar.frame = CGRectMake(854, 61, 165, 466);
    [self.view insertSubview:self.vodkaBar atIndex:0];
    self.vodkaLabel.textAlignment = UITextAlignmentCenter;
    self.vodkaLabel.backgroundColor = [UIColor clearColor];
    self.vodkaLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
    self.vodkaLabel.text = [NSString stringWithFormat: @"%d", vodkaValue];
    [self.view addSubview:vodkaLabel];
    if (vodkaValue == 0)
    {
        self.vodkaBar.hidden = YES;
        self.vodkaLabel.hidden = YES;
    }
    
    // Tamsinimai
    if ([mostWanted isEqualToString:@"sultys"])
    {
        [self.view addSubview:self.patamsejimas];
        [self.view bringSubviewToFront:self.patamsejimas];
        [self.view bringSubviewToFront:self.winnerLabel];
        [self.view bringSubviewToFront:self.backButton];
        [self.view bringSubviewToFront:self.tekstas];
        
        [self.view bringSubviewToFront:self.sultys];
        [self.view bringSubviewToFront:self.sultysBar];
        [self.view bringSubviewToFront:self.sultysLabel];
    }
    if ([mostWanted isEqualToString:@"sidras"])
    {
        [self.view addSubview:self.patamsejimas];
        [self.view bringSubviewToFront:self.patamsejimas];
        [self.view bringSubviewToFront:self.winnerLabel];
        [self.view bringSubviewToFront:self.backButton];
        [self.view bringSubviewToFront:self.tekstas];
        
        [self.view bringSubviewToFront:self.sidras];
        [self.view bringSubviewToFront:self.sidrasBar];
        [self.view bringSubviewToFront:self.sidrasLabel];
    }
    if ([mostWanted isEqualToString:@"alus"])
    {
        [self.view addSubview:self.patamsejimas];
        [self.view bringSubviewToFront:self.patamsejimas];
        [self.view bringSubviewToFront:self.winnerLabel];
        [self.view bringSubviewToFront:self.backButton];
        [self.view bringSubviewToFront:self.tekstas];
        
        [self.view bringSubviewToFront:self.alus];
        [self.view bringSubviewToFront:self.alusBar];
        [self.view bringSubviewToFront:self.alusLabel];
    }
    if ([mostWanted isEqualToString:@"vynas"])
    {
        [self.view addSubview:self.patamsejimas];
        [self.view bringSubviewToFront:self.patamsejimas];
        [self.view bringSubviewToFront:self.winnerLabel];
        [self.view bringSubviewToFront:self.backButton];
        [self.view bringSubviewToFront:self.tekstas];
        
        [self.view bringSubviewToFront:self.vynas];
        [self.view bringSubviewToFront:self.vynasBar];
        [self.view bringSubviewToFront:self.vynasLabel];
    }
    if ([mostWanted isEqualToString:@"putojantis_vynas"])
    {
        [self.view addSubview:self.patamsejimas];
        [self.view bringSubviewToFront:self.patamsejimas];
        [self.view bringSubviewToFront:self.winnerLabel];
        [self.view bringSubviewToFront:self.backButton];
        [self.view bringSubviewToFront:self.tekstas];
        
        [self.view bringSubviewToFront:self.putojantis];
        [self.view bringSubviewToFront:self.putojantisBar];
        [self.view bringSubviewToFront:self.putojantisLabel];
    }
    if ([mostWanted isEqualToString:@"vodka"])
    {
        [self.view addSubview:self.patamsejimas];
        [self.view bringSubviewToFront:self.patamsejimas];
        [self.view bringSubviewToFront:self.winnerLabel];
        [self.view bringSubviewToFront:self.backButton];
        [self.view bringSubviewToFront:self.tekstas];
        
        [self.view bringSubviewToFront:self.vodka];
        [self.view bringSubviewToFront:self.vodkaBar];
        [self.view bringSubviewToFront:self.vodkaLabel];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.winnerLabel.alpha = 0.0;
    self.resetButton.enabled = NO;
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

- (UIImage*)imageByCropping:(UIImage *)imageToCrop toPercents:(NSInteger)percents
{
    float onePercentHeight = (imageToCrop.size.height / 100);
    NSInteger cutPixels = (NSInteger)(onePercentHeight * percents);
    
    CGRect rect = CGRectMake(0, 0, imageToCrop.size.width, imageToCrop.size.height);

    UIGraphicsBeginImageContext(rect.size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGRect clippedRect = CGRectMake(0, (rect.size.height - cutPixels), rect.size.width, rect.size.height);
    CGContextClipToRect( currentContext, clippedRect);
    
    CGRect drawRect = CGRectMake(rect.origin.x * -1,
                                 rect.origin.y * -1,
                                 imageToCrop.size.width,
                                 imageToCrop.size.height);
    
    [imageToCrop drawInRect:drawRect];
    
    UIImage *cropped = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return cropped;
}

- (void)back
{
    self.parent.splashView.alpha = 1.0;
	[UIView beginAnimations:nil context:nil];
	self.view.alpha = 0.0;
	[UIView commitAnimations];
    
    [self.sultysBar removeFromSuperview];
    [self.sidrasBar removeFromSuperview];
    [self.alusBar removeFromSuperview];
    [self.vynasBar removeFromSuperview];
    [self.putojantisBar removeFromSuperview];
    [self.vodkaBar removeFromSuperview];
    [self.sultysLabel removeFromSuperview];
    [self.sidrasLabel removeFromSuperview];
    [self.alusLabel removeFromSuperview];
    [self.vynasLabel removeFromSuperview];
    [self.putojantisLabel removeFromSuperview];
    [self.vodkaLabel removeFromSuperview];
    
    [self.view removeFromSuperview];
}

- (void)reset
{
    self.resetAlert = [[UIAlertView alloc] initWithTitle:@"Dėmesio"
                                                 message:@"Ar jūs tikrai norite ištrinti rezultatų duomenis?"
                                                delegate:self
                                       cancelButtonTitle:@"Taip"
                                       otherButtonTitles:@"Ne", nil];
    [self.resetAlert show];
}

#pragma mark - UIAlertView delegate methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == self.resetAlert)
    {
        if (buttonIndex == 0)
        {
            [self.parent.data setObject:[NSNumber numberWithInt:0] forKey:@"sultys"];
            [self.parent.data setObject:[NSNumber numberWithInt:0] forKey:@"sidras"];
            [self.parent.data setObject:[NSNumber numberWithInt:0] forKey:@"alus"];
            [self.parent.data setObject:[NSNumber numberWithInt:0] forKey:@"vynas"];
            [self.parent.data setObject:[NSNumber numberWithInt:0] forKey:@"putojantis_vynas"];
            [self.parent.data setObject:[NSNumber numberWithInt:0] forKey:@"vodka"];
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
            [self.parent.data writeToFile:path atomically:NO];
        
            [self back];
        
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Atlikta"
                                                            message:@"Turimi rezultatai buvo ištrinti"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }
}

@end
