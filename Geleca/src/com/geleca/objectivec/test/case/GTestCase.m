//
//  GTestCase.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/20/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import "GTestCase.h"

@implementation GTestCase
@synthesize view;

-(void)run {
	NSLog(@"%@::run()", self);
	[self setup];
}

-(void)setup {
	
}

-(void)testComplete {
	[self dispatchEvent:[Event withType:[Event COMPLETE]]];
}

-(void)assert:(BOOL)condition description:(NSString *)description {
	_assertions ++;
	
	if(!condition)
		NSLog(@"[FAILED] %@", description);
	//NSAssert(condition, description);
}

-(int)assertions { return _assertions; }

@end
