//
//  PassTheTorchViewController.h
//  PassTheTorch
//
//  Created by Ryan Shea on 2/2/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PassTheTorchViewController : UIViewController

@property (nonatomic) int flameIntensity; // 0 is out, 100 is full flame
@property (weak, nonatomic) IBOutlet UIImageView *torchImageView;
@property (weak, nonatomic) IBOutlet UIButton *torchButton;

@end
