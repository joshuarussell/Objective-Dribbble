//
//  Player.m
//  Dribbble API Wrapper
//
//  Created by Joshua Russell on 12/08/10.
//  Copyright 2010 Joshua Russell. All rights reserved.
//

#import "Player.h"


@implementation Player
@synthesize playerID;

#pragma mark -
#pragma mark Find
/*
 Returns profile details for a player specified by :playerId. 
*/
- (Base *) find:(NSString *)playerId {
	NSString *shotURL = [[[NSString alloc] initWithString:@"/players/"] stringByAppendingFormat:@"%@", playerId];
	results					= [[Base alloc] initWithURL:shotURL andOptions:nil];
	playerID				= [NSString stringWithFormat:@"%@", [results objectForKey:@"id"]];
	return results;
}



#pragma mark -
#pragma mark Shots For Player
/*
	Returns the most recent shots for the player specified by :playerId.
*/
- (Base *) shots:(NSMutableDictionary *)options {
	NSString *shotURL = [[[NSString alloc] initWithString:@"/players/"] stringByAppendingFormat:@"%@/shots",playerID];
	results = [[Base alloc] initWithURL:shotURL andOptions:options];
	return results;
}



#pragma mark -
#pragma mark Shots By Followers
/*
	Returns the most recent shots published by those the player specified by :playerId is following. 
*/
- (Base *) shotsByFollowers:(NSMutableDictionary *)options {
	NSString *shotURL = [[[NSString alloc] initWithString:@"/players/"] stringByAppendingFormat:@"%@/shots/following",playerID];
	results = [[Base alloc] initWithURL:shotURL andOptions:options];
	return results;
}



#pragma mark -
#pragma mark Player Followers
/*
 Returns the list of followers for a player specified by :playerId. 
*/
- (Base *) followers:(NSMutableDictionary *)options {
	NSString *shotURL = [[[NSString alloc] initWithString:@"/players/"] stringByAppendingFormat:@"%@/followers",playerID];
	results = [[Base alloc] initWithURL:shotURL andOptions:options];
	return results;
}



#pragma mark -
#pragma mark Player Following
/*
 Returns the list of followers for a player specified by :playerId. 
 */
- (Base *) following:(NSMutableDictionary *)options {
	NSString *shotURL = [[[NSString alloc] initWithString:@"/players/"] stringByAppendingFormat:@"%@/following",playerID];
	results = [[Base alloc] initWithURL:shotURL andOptions:options];
	return results;
}



#pragma mark - 
#pragma mark - Player Draftees
/*
Returns the list of players drafted by the player specified by :playerId. 
*/
- (Base *) draftees:(NSMutableDictionary *)options {
	NSString *shotURL = [[[NSString alloc] initWithString:@"/players/"] stringByAppendingFormat:@"%@/draftees",playerID];
	results = [[Base alloc] initWithURL:shotURL andOptions:options];
	return results;
}



#pragma mark -
#pragma mark Memory Management
- (void) dealloc {
	[playerID				release];
	[super					dealloc];
}

@end
