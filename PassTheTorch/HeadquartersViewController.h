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

@property (nonatomic, retain) BumpConnector *bumpConn;
@property (weak, nonatomic) IBOutlet UIButton *passFlameButton;
@property (weak, nonatomic) IBOutlet UIButton *purchaseFlameButton;
@property (weak, nonatomic) IBOutlet UIButton *extinguishFlameButton;
@property (weak, nonatomic) IBOutlet UILabel *headquartersMessage;

- (void)applyMessage;

@end
