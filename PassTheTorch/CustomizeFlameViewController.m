//
//  CustomizeFlameViewController.m
//  PassTheTorch
//
//  Created by Ryan Shea on 2/4/12.
//  Copyright (c) 2012 Princeton. All rights reserved.
//

#import "CustomizeFlameViewController.h"
#import "UserData.h"

@implementation CustomizeFlameViewController
@synthesize flameMessage = _flameMessage;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Create Flame"]) {
        [UserData sharedInstance].hasFlame = YES;
        [UserData sharedInstance].flameMessage = self.flameMessage.text;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range 
 replacementText:(NSString *)text
{
    // Any new character added is passed in as the "text" parameter
    if ([text isEqualToString:@"\n"]) {
        // Be sure to test for equality using the "isEqualToString" message
        [textView resignFirstResponder];
        
        // Return FALSE so that the final '\n' character doesn't get added
        return FALSE;
    }
    // For any other character return TRUE so that the text gets added to the view
    return TRUE;
}

- (void)viewWillAppear:(BOOL)animated
{
    if ([UserData sharedInstance].flameMessage == (id)[NSNull null] || [UserData sharedInstance].flameMessage.length == 0) {
        self.flameMessage.text = @"Other flame message";
    } else {
        self.flameMessage.text = [UserData sharedInstance].flameMessage;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    [self setFlameMessage:nil];
    [super viewDidUnload];
}
@end
