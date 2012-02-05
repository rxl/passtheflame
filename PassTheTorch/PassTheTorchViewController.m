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
#import <QuartzCore/QuartzCore.h>
#import "FlameLayer.h"

@interface PassTheTorchViewController() <TorchViewDataSource>
@property (nonatomic, weak) IBOutlet TorchView *torchView;
@end

@implementation PassTheTorchViewController
@synthesize torchImageView = _torchImageView;
@synthesize torchButton = _torchButton;

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
    //[self.navigationController setNavigationBarHidden:NO animated:NO];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidLoad
{
    // make background black
    self.torchView.backgroundColor = [UIColor blackColor];

    // add flame
    FlameLayer *flame = [[FlameLayer alloc] initWithFrame:self.view.frame];
    [self.torchView addSubview:flame];
    
    // add front of torch
    UIImageView *torch_front = [[UIImageView alloc] initWithFrame:self.torchImageView.frame];
    torch_front.image = [UIImage imageNamed:@"london_transparent_front.png"];
    torch_front.layer.zPosition = 2;
    [self.torchView addSubview:torch_front];

    // hack to make the torchbutton work... otherwise it's inactive
    // problem is it's already in the view, so it seems like it's added twice
    [self.torchView addSubview:self.torchButton];
}

- (void)viewDidUnload {
    [self setTorchImageView:nil];
    [self setTorchButton:nil];
    [super viewDidUnload];
}
@end
