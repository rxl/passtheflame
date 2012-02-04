//
//  TorchView.m
//  PassTheTorch
//
//  Created by Ryan Shea on 2/2/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import "TorchView.h"

@implementation TorchView

@synthesize dataSource;

- (void)setup
{
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

/*- (void)drawRect:(CGRect)rect
{
    //CGContextRef context = UIGraphicsGetCurrentContext();
    float flameSize = [self.dataSource flameForTorchView:self];
    if (flameSize < 0) flameSize = 0;
    if (flameSize > 1) flameSize = 1;
}*/


@end
