//
//  Base.m
//  Dribbble API Wrapper
//
//  Created by Joshua Russell on 11/08/10.
//  Copyright 2010 Joshua Russell. All rights reserved.
//

#import "Base.h"
#import "JSON.h"

@implementation Base

@synthesize baseURL;

#pragma mark -
#pragma mark Init
- (id) initWithURL:(NSString *)urlPath andOptions:(NSMutableDictionary *)options {
	
	[super init];
	
	// setup the responseData object
	responseData = [[NSMutableData data] retain];
	
	// set up the baseURL object
	baseURL = [[[NSString alloc] initWithString:@"http://api.dribbble.com"] stringByAppendingString:urlPath];	
	
	// if there are options
	if([options count] > 0) {
		// append the options to the URL
		baseURL = [[baseURL stringByAppendingString:@"?page="]	stringByAppendingString:[options objectForKey:@"page"]];
		
		baseURL = [[baseURL stringByAppendingString:@"&per_page="] stringByAppendingString:[options objectForKey:@"per_page"]];
		
		// produces something like
		// http://api.dribbble.com/shots/?page=5&per_page=1
	}
	
	NSLog(@"----------------------------------------------------------------------");
	NSLog(@"Connecting to: %@", baseURL);
	NSLog(@"----------------------------------------------------------------------");
	
	// create a URL connection using our baseURL object
	NSURLRequest		*request		= [NSURLRequest requestWithURL:[NSURL URLWithString:baseURL]];
	NSURLResponse		*response		= [[NSURLResponse alloc] init];  
	NSError				*error			= [[NSError alloc] init];  
	NSData				*data			= [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	
	// set the response data
	[responseData setData:data];
			
	// convert the NSData responseData object to a NSString object
	NSString			*responseString	= [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	
	// get the results in JSON format
	NSMutableDictionary *results		= [responseString JSONValue];

	// don't forget to clean up after yourself
	[responseData	release];
	[error			release];
	[responseString release];
	
	// return the results for later use
	return results;
}

#pragma mark -
#pragma mark Memory Management
- (void) dealloc {
	[baseURL	release];
	[super		dealloc];
}

@end
