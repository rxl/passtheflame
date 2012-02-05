//
//  CustomizeFlameViewController.m
//  PassTheTorch
//
//  Created by Ryan Shea on 2/4/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import "CustomizeFlameViewController.h"
#import "UserData.h"

@implementation CustomizeFlameViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Create Flame"]) {
        [UserData sharedInstance].hasFlame = YES;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}

@end
