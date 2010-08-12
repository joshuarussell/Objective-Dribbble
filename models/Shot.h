//
//  Shot.h
//  Dribbble API Wrapper
//
//  Created by Joshua Russell on 11/08/10.
//  Copyright 2010 Joshua Russell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Base.h"

@interface Shot : Base {
	NSString	*shotID;                
	id			results;
}

#pragma mark -
#pragma mark Properties
@property (nonatomic,retain) NSString *shotID;

#pragma mark -
#pragma mark Method Declarations
- (Base *) find:(NSString *)shotId;
- (Base *) popular:(NSMutableDictionary *)options;
- (Base *) everyone:(NSMutableDictionary *)options;
- (Base *) debuts:(NSMutableDictionary *)options;

@end
