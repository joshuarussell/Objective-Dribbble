//
//  Player.h
//  Dribbble API Wrapper
//
//  Created by Joshua Russell on 12/08/10.
//  Copyright 2010 Joshua Russell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Base.h"

@interface Player : Base {
	NSString	*playerID;
	id			results;
}


#pragma mark -
#pragma mark Properties
@property(nonatomic, retain) NSString *playerID;

#pragma mark -
#pragma mark Method Declarations
- (Base *) find:(NSString *)shotId;
- (Base *) shots:(NSMutableDictionary *)options;
- (Base *) shotsByFollowers:(NSMutableDictionary *)options;
- (Base *) followers:(NSMutableDictionary *)options;
- (Base *) following:(NSMutableDictionary *)options;
- (Base *) draftees:(NSMutableDictionary *)options;
@end
