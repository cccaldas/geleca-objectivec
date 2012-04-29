/*
	Event.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/6/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "Event.h"

@implementation Event

@synthesize target, type;

-(id)initWithType:(NSString *)_type {
	if((self = [super init])){
		self.type = _type;
	}
	
	return self;
}

+(id)withType:(NSString *)type {
	return [[[Event alloc] initWithType:type] autorelease];
}

+(NSString *)COMPLETE	{ return @"complete"; }
+(NSString *)CHANGE		{ return @"change"; }
+(NSString *)CANCEL		{ return @"cancel"; }
+(NSString *)ADD		{ return @"add"; }

-(void)dealloc {
	self.target = nil;
	self.type	= nil;
	
	[super dealloc];
}

@end
