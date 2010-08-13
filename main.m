//
//  main.m
//  Dribbble API Wrapper
//
//  Created by Joshua Russell on 12/08/10.
//  Copyright 2010 Joshua Russell. All rights reserved.
//


//	NOTE:
//	The NSMutableDictionary that is the "options" can be "nil".
//	Meaning that you don't need to pass the page, and per_page params.
//	
//	ie. for the allShots object, if you do not supply the "options", it will return 15 results for page 1 (API Default)


#import <Foundation/Foundation.h>
#import "Shot.h"
#import "Player.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	// init the Shot and Player classes
	Shot	*shot	= [[Shot	alloc]	init];
	Player  *player	= [[Player	alloc]	init];

	// get a shot for a specific ID
	id shotResult = [shot find:@"29664"];
	NSLog(@"%@", shotResult);
	
	// more info about the shot
	NSLog(@"Shot Title: %@",		[shotResult objectForKey:@"title"]);
	NSLog(@"Shot Created At: %@",	[shotResult objectForKey:@"created_at"]);
	
	// popular shots
	id popularShots	= [shot popular: [NSMutableDictionary dictionaryWithObjectsAndKeys:@"8", @"page", @"4", @"per_page", nil]];
	NSLog(@"%@", popularShots);
	
	// all shots
	id allShots	= [shot everyone: [NSMutableDictionary dictionaryWithObjectsAndKeys:@"2", @"page", @"2", @"per_page", nil]];
	NSLog(@"%@", allShots);
	
	// debut shots
	id debuts = [shot debuts: [NSMutableDictionary dictionaryWithObjectsAndKeys:@"5", @"page", @"3", @"per_page", nil]];
	NSLog(@"%@", debuts);
	
	// player information
	id playerInfo = [player find:@"joshrussell"];
	NSLog(@"Player Info: %@", playerInfo);
	
	// shots by player
	id playerShots = [player shots:[NSMutableDictionary	dictionaryWithObjectsAndKeys:@"1", @"page", @"1", @"per_page", nil]];
	NSLog(@"%@", playerShots);
	
	// shots by people player follows
	id shotsByFollowers = [player shotsByFollowers:[NSMutableDictionary	dictionaryWithObjectsAndKeys:@"1", @"page", @"3", @"per_page", nil]];
	NSLog(@"%@", shotsByFollowers);
	
	// example as to how to get data from the dictionary
	NSLog(@"%@", [[shotsByFollowers objectForKey:@"shots"] valueForKey:@"image_teaser_url"]);
	
	// get people that follow the player
	id followers = [player followers:nil];
	NSLog(@"Followers: %@", followers);
	
	// get people that player is following
	id following = [player following:nil];
	NSLog(@"Following: %@", following);


	// get people that player has drafted
	id drafted = [player draftees:nil];
	NSLog(@"Draftees: %@", drafted);
	
    [pool drain];
	
    return 0;
}