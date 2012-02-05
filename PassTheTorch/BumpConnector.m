//
//  BumpConnector.m
//  PassTheTorch
//
//  Created by Momchil Tomov on 2/4/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import "BumpConnector.h"
#import "HeadquartersViewController.h"
#import "PassTheTorchViewController.h"

@implementation BumpConnector

@synthesize bumpViewController = _bumpViewController;

- (id) init{
	if(self = [super init]){
        // init user data ...
        // ...
		bumpObject = [BumpAPI sharedInstance];
        // bump sound? see demo app
	}
	return self;
}

-(void) configBump{
	[bumpObject configAPIKey:@"2cb5d541340644dabe8de05784cb79f4"];
	[bumpObject configDelegate:self];
	[bumpObject configParentView:self.bumpViewController.view];
	[bumpObject configActionMessage:@"Bump with another BumpFour player to start game."];
}

- (void) startBump{
	[self configBump];
	[bumpObject requestSession];
}

- (void) stopBump{
	[bumpObject endSession];
}

- (void) passFlame:(NSString *)message {
	NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] initWithCapacity:5];
	[dataDict setObject:[[bumpObject me] userName]  forKey:@"USER_ID"];
	[dataDict setObject:message forKey:@"MESSAGE"];
	
	NSData *dataChunk = [NSKeyedArchiver archivedDataWithRootObject:dataDict];
	[bumpObject sendData:dataChunk];
    
	NSLog(@"sending data %@", dataChunk);
	//call this here incase we are late and already have the opponnent roll.
    // do stuff --- set some fields according to the data
}


#pragma mark Utility

// for Debug -- prints contents of NSDictionary
-(void)printDict:(NSDictionary *)ddict {
	NSLog(@"---printing Dictionary---");
	NSArray *keys = [ddict allKeys];
	for (id key in keys) {
		NSLog(@"   key = %@     value = %@",key,[ddict objectForKey:key]);
	}	
}

#pragma mark -
#pragma mark BumpAPIDelegate methods

- (void) bumpDataReceived:(NSData *)chunk{
	//The chunk was packaged by the other user using an NSKeyedArchiver, so we unpackage it here with our NSKeyedUnArchiver
	NSDictionary *responseDictionary = [NSKeyedUnarchiver unarchiveObjectWithData:chunk];
	[self printDict:responseDictionary];
	
	//responseDictionary no contains an Identical dictionary to the one that the other user sent us
	NSString *userName = [responseDictionary objectForKey:@"USER_ID"];
    NSString *message = [responseDictionary objectForKey:@"MESSAGE"];
	
	NSLog(@"user name is %@, message is %@", userName, message);
    [self.bumpViewController applyMessage:message];
    
}

- (void) bumpSessionStartedWith:(Bumper*)otherBumper{
	[self passFlame:@"fuck you bitch"];
}

- (void) bumpSessionEnded:(BumpSessionEndReason)reason {
	NSString *alertText;
	switch (reason) {
		case END_OTHER_USER_QUIT:
			alertText = @"Other user has quit the game.";
			break;
		case END_LOST_NET:
			alertText = @"Connection to Bump server was lost.";
			break;
		case END_OTHER_USER_LOST:
			alertText = @"Connection to other user was lost.";
			break;
		case END_USER_QUIT:
			alertText = @"You have been disconnected.";
			break;
		default:
			alertText = @"You have been disconnected.";
			break;
	}
	
	if(reason != END_USER_QUIT){ 
		//if the local user initiated the quit,restarting the app is already being handled
		//other wise we'll restart here
        // RESTART PROGRAM??? 
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Disconnected" message:alertText delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
	}
}

- (void) bumpSessionFailedToStart:(BumpSessionStartFailedReason)reason {
	
	NSString *alertText;
	switch (reason) {
		case FAIL_NETWORK_UNAVAILABLE:
			alertText = @"Please check your network settings and try again.";
			break;
		case FAIL_INVALID_AUTHORIZATION:
			//the user should never see this, since we'll pass in the correct API auth strings.
			//just for debug.
			alertText = @"Failed to connect to the Bump service. Auth error.";
			break;
		default:
			alertText = @"Failed to connect to the Bump service.";
			break;
	}
	
    // RESTART PRPGRAM???
	if(reason != FAIL_USER_CANCELED){
		//if the user canceled they know it and they don't need a popup.
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Failed" message:alertText delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
	}
}


@end
