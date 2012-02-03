//
//  HeadquartersView.h
//  PassTheTorch
//
//  Created by Ryan Shea on 2/2/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeadquartersView;

@protocol HeadquartersViewDataSource <NSObject>
- (float)hasFlameForHeadquartersView:(HeadquartersView *)sender;
@end

@interface HeadquartersView : UIView

@property (nonatomic, weak) IBOutlet id <HeadquartersViewDataSource> dataSource;

@end
