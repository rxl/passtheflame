//
//  HeadquartersViewController.m
//  PassTheTorch
//
//  Created by Ryan Shea on 2/2/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import "HeadquartersViewController.h"
#import "HeadquartersView.h"

@interface HeadquartersViewController() <HeadquartersViewDataSource>
@property (nonatomic, weak) IBOutlet HeadquartersView *headquartersView;
@end

@implementation HeadquartersViewController

@synthesize hasFlame = _hasFlame;
@synthesize headquartersView = _headquartersView;

- (void)setHasFlame:(BOOL)hasFlame
{
    _hasFlame = hasFlame;
    [self.headquartersView setNeedsDisplay];
}

- (void)setHeadquartersView:(HeadquartersView *)headquartersView
{
    _headquartersView = headquartersView;
    self.headquartersView.dataSource = self;
}

- (float)hasFlameForHeadquartersView:(HeadquartersView *)sender
{
    return self.hasFlame;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return NO;
}

@end
