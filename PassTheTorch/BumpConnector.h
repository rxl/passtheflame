//
//  BumpConnector.h
//  PassTheTorch
//
//  Created by Momchil Tomov on 2/4/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "BumpAPI.h"
#import "Bumper.h"

@class HeadquartersViewController;

@interface BumpConnector : NSObject <BumpAPIDelegate> 
{
	HeadquartersViewController *bumpViewController;
	BumpAPI *bumpObject;
}

@property (strong, nonatomic) HeadquartersViewController *bumpViewController;

- (void) passFlame:(NSString *)message;
- (void) startBump;
- (void) stopBump;

@end
