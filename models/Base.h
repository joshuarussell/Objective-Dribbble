//
//  Base.h
//  Dribbble API Wrapper
//
//  Created by Joshua Russell on 11/08/10.
//  Copyright 2010 Joshua Russell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base : NSObject  {
	NSString		*baseURL;
	NSMutableData	*responseData;
}

#pragma mark -
#pragma mark Properties
@property (nonatomic, retain) NSString *baseURL;

#pragma mark -
#pragma mark Method Declarations
- (id) initWithURL:(NSString *)urlPath andOptions:(NSMutableDictionary *)options;

@end
