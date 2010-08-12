//
//  Shot.m
//  Dribbble API Wrapper
//
//  Created by Joshua Russell on 11/08/10.
//  Copyright 2010 Joshua Russell. All rights reserved.
//

#import "Shot.h"
#import "Base.h"

@implementation Shot

@synthesize shotID;

#pragma mark -
#pragma mark Find
/*
	Fetches a shot based on a specific shot ID	
*/
- (Base *) find:(NSString *)sShotID {
	NSString *shotURL = [[[NSString alloc] initWithString:@"/shots/"] stringByAppendingFormat:@"%@",sShotID];
	results = [[Base alloc] initWithURL:shotURL andOptions:nil];
	return results;
}



#pragma mark -
#pragma mark Popular
/*
	Fetches current popular shots
*/
- (Base *) popular:(NSMutableDictionary *)options {
	NSString *shotURL = [[NSString alloc] initWithString:@"/shots/popular"];
	results = [[Base alloc] initWithURL:shotURL andOptions:options];
	return results;
}



#pragma mark -
#pragma mark Everyone
/*
	Fetches everyones shots
*/
- (Base *) everyone:(NSMutableDictionary *)options {
	NSString *shotURL = [[NSString alloc] initWithString:@"/shots/everyone"];
	results = [[Base alloc] initWithURL:shotURL andOptions:options];
	return results;
}



#pragma mark -
#pragma mark Debuts
/*
	Fetches all debut shots
*/

- (Base *) debuts:(NSMutableDictionary *)options {
	NSString *shotURL = [[NSString alloc] initWithString:@"/shots/debuts"];
	results = [[Base alloc] initWithURL:shotURL andOptions:options];
	return results;
}



#pragma mark -
#pragma mark Memory Management
- (void) dealloc {
	[super dealloc];
}

@end
