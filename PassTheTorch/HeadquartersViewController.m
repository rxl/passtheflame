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
@synthesize headquartersMessage = _headquartersMessage;

- (void)setHeadquartersView:(HeadquartersView *)headquartersView
{
    _headquartersView = headquartersView;
//    self.headquartersView.dataSource = self; ??
}

// the user wants to receive a flame
- (IBAction)pressReceiveFlame:(id)sender
{
	self.bumpConn = [[BumpConnector alloc] init];
	[self.bumpConn setBumpViewController:self];
	[self.bumpConn startBump];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)applicationWillTerminate:(UIApplication *)application
{
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
        [self.passFlameButton setTitle:@"Pass Flame" forState:UIControlStateNormal];
        self.purchaseFlameButton.hidden = YES;
        self.extinguishFlameButton.hidden = NO;
        self.headquartersMessage.text = [UserData sharedInstance].flameMessage;
        [self.headquartersMessage setFont:[UIFont fontWithName:@"Zapfino" size:20.0]];
    } else {
        [self.passFlameButton setTitle:@"Receive Flame From Friend" forState:UIControlStateNormal];
        self.headquartersMessage.text = @"Oh no... it looks like you don't have a flame. Purchase one or receive one from a friend to light your torch.";
        self.purchaseFlameButton.hidden = NO;
        self.extinguishFlameButton.hidden = YES;
    }
}

#pragma mark
#pragma public methods

// called by the bump api when the messge is received
- (void)applyMessage
{
    [self.bumpConn stopBump];
    [self performSegueWithIdentifier:@"fromHQToTorch" sender:self];
}

- (void)viewDidUnload {
    _passFlameButton = nil;
    [self setPassFlameButton:nil];
    [self setPurchaseFlameButton:nil];
    [self setExtinguishFlameButton:nil];
    [self setHeadquartersMessage:nil];
    [super viewDidUnload];
}
@end
