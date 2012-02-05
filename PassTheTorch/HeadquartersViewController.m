//
//  HeadquartersViewController.m
//  PassTheTorch
//
//  Created by Ryan Shea on 2/2/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import "HeadquartersViewController.h"
#import "HeadquartersView.h"
#import "UserData.h"

@interface HeadquartersViewController()
@property (nonatomic, weak) IBOutlet HeadquartersView *headquartersView;
@end

@implementation HeadquartersViewController

@synthesize headquartersView = _headquartersView;
@synthesize bumpConn = _bumpConn;
@synthesize passFlameButton = _passFlameButton;
@synthesize purchaseFlameButton = _purchaseFlameButton;
@synthesize extinguishFlameButton = _extinguishFlameButton;

- (void)setHeadquartersView:(HeadquartersView *)headquartersView
{
    _headquartersView = headquartersView;
//    self.headquartersView.dataSource = self; ??
}

// the user wants to receive a flame
- (IBAction)pressReceiveFlame:(id)sender {
	self.bumpConn = [[BumpConnector alloc] init];
	[self.bumpConn setBumpViewController:self];
	[self.bumpConn startBump];
}

- (float)hasFlameForHeadquartersView:(HeadquartersView *)sender
{
    return self.hasFlame;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)applicationWillTerminate:(UIApplication *)application{
	[self.bumpConn stopBump];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Extinguish Flame"]) {
        [UserData sharedInstance].hasFlame = NO;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    if ([UserData sharedInstance].hasFlame) {
        self.passFlameButton.titleLabel.text = @"Pass Flame";
        self.purchaseFlameButton.hidden = YES;
        self.extinguishFlameButton.hidden = NO;
    } else {
        self.passFlameButton.titleLabel.text = @"Receive Flame From Friend";
        self.purchaseFlameButton.hidden = NO;
        self.extinguishFlameButton.hidden = YES;
    }
}


#pragma mark
#pragma public methods

// called by the bump api when the messge is received
- (void)applyMessage:(NSString *)message
{
    [self.bumpConn stopBump];
    [self performSegueWithIdentifier:@"fromHQToTorch" sender:self];
}

- (void)viewDidUnload {
    _passFlameButton = nil;
    [self setPassFlameButton:nil];
    [self setPurchaseFlameButton:nil];
    [self setExtinguishFlameButton:nil];
    [super viewDidUnload];
}
@end
