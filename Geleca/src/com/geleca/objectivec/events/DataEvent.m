/*
 DataEvent.m
 Geleca
 
 Created by Cristiano Coutinho Caldas on 4/7/12.
 Copyright (c) 2012 Simbionte Studios. All rights reserved.
 */

#import "DataEvent.h"

@implementation DataEvent
@synthesize data;

-(id)initWithType:(NSString *)_type data:(id)_data {
	if((self = [super init])){
		self.type = _type;
		self.data = _data;
	}
	
	return self;
}

+(id)withType:(NSString *)type data:(id)data {
	return [[[DataEvent alloc] initWithType:type data:data] autorelease];
}

-(void)dealloc {
	self.data = nil;
	
	[super dealloc];
}

@end
