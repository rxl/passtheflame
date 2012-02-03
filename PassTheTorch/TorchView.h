//
//  TorchView.h
//  PassTheTorch
//
//  Created by Ryan Shea on 2/2/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TorchView;

@protocol TorchViewDataSource <NSObject>
- (float)flameForTorchView:(TorchView *)sender;
@end

@interface TorchView : UIView

@property (nonatomic, weak) IBOutlet id <TorchViewDataSource> dataSource;

@end
