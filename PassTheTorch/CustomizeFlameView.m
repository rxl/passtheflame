//
//  CustomizeFlameView.m
//  PassTheTorch
//
//  Created by Ryan Shea on 2/5/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import "CustomizeFlameView.h"

@implementation CustomizeFlameView

- (void)setup
{
    self.backgroundColor = [UIColor blackColor];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
