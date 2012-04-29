/*
	EventHandler.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/6/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "EventHandler.h"

@implementation EventHandler
@synthesize obj, method;

-(id)initWithObject:(id)_obj method:(SEL)_method {
	if((self = [super init])){
		obj		= _obj;
		method	= _method;
	}
	return self;
}

-(void)dealloc {
	obj		= nil;
	method	= nil;
	
	[super dealloc];
}

@end
