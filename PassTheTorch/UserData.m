//
//  UserData.m
//  PassTheTorch
//
//  Created by Ryan Shea on 2/4/12.
//  Copyright 2012 Princeton. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "UserData.h"

@implementation UserData

@synthesize hasFlame;
@synthesize flameMessage;

#pragma mark Singleton Methods
+ (UserData*)sharedInstance {
	static UserData *_sharedInstance;
	if(!_sharedInstance) {
		static dispatch_once_t oncePredicate;
		dispatch_once(&oncePredicate, ^{
			_sharedInstance = [[super allocWithZone:nil] init];
			});
		}
		return _sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        hasFlame = NO;
        flameMessage = [[NSString alloc] initWithString:@"This is my flame"];
    }
    return self;
}
- (void)dealloc {
    
}

#pragma mark -
#pragma mark Custom Methods

// Add your custom methods here

@end
