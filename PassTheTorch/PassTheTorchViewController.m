//
//  PassTheTorchViewController.m
//  PassTheTorch
//
//  Created by Ryan Shea on 2/2/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import "PassTheTorchViewController.h"
#import "TorchView.h"
#import "HeadquartersViewController.h"

@interface PassTheTorchViewController() <TorchViewDataSource>
@property (nonatomic, weak) IBOutlet TorchView *torchView;
@end

@implementation PassTheTorchViewController

@synthesize flameIntensity = _flameIntensity;
@synthesize torchView = _torchView;

- (void)showHeadquartersView
{
    [self performSegueWithIdentifier:@"ShowHeadquarters" sender:self];
    /*if (self.flameIntensity > 0) {
        [self performSegueWithIdentifier:@"ShowHeadquartersForFlamePossesser" sender:self];
    } else {
        [self performSegueWithIdentifier:@"ShowHeadquartersForNonFlamePossessor" sender:self];
    }*/
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowHeadquarters"]) {
        if (self.flameIntensity > 0) {
            [segue.destinationViewController setHasFlame:YES];
        } else {
            [segue.destinationViewController setHasFlame:NO];
        }
    }
    
    /*if ([segue.identifier isEqualToString:@"ShowHeadquartersForFlamePossessor"]) {
        [segue.destinationViewController setHasFlame:YES];
    } else if ([segue.identifier isEqualToString:@"ShowHeadquartersForNonFlamePossessor"]) {
        [segue.destinationViewController setHasFlame:NO];
    }*/
}


- (void)setFlameIntensity:(int)flameIntensity
{
    _flameIntensity = flameIntensity;
    [self.torchView setNeedsDisplay];
}

- (void)setTorchView:(TorchView *)torchView
{
    _torchView = torchView;
    
    self.torchView.dataSource = self;
}

- (float)flameForTorchView:(TorchView *)sender
{
    return (self.flameIntensity / 100.0);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return NO;
}

@end
