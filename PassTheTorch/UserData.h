//
//  UserData.h
//  PassTheTorch
//
//  Created by Ryan Shea on 2/4/12.
//  Copyright 2012 Princeton. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>

@interface UserData : NSObject {
    BOOL hasFlame;
}

@property (nonatomic, assign) BOOL hasFlame;

+ (UserData*) sharedInstance;
@end
