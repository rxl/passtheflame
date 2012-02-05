//
//  HeadquartersViewController.h
//  PassTheTorch
//
//  Created by Ryan Shea on 2/2/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BumpConnector.h"

@interface HeadquartersViewController : UIViewController
{
    BumpConnector *bumpConn;
}

@property (nonatomic) BOOL hasFlame; // YES if person has flame, NO if person does not
@property (nonatomic, retain) BumpConnector *bumpConn;
@property (weak, nonatomic) IBOutlet UIButton *passFlameButton;

- (void)applyMessage:(NSString *)message;

@end
