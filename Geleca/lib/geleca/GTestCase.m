//
//  GTestCase.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/20/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import "GTestCase.h"

@implementation GTestCase
@synthesize delegate;

-(void)run {
	NSLog(@"%@::run()", self);
	[self setup];
}

-(void)setup {
	
}

-(void)testComplete {
	[self.delegate testCaseComplete:self];
}

-(void)assert:(BOOL)condition description:(NSString *)description {
	_assertions ++;
	
	if(!condition)
		NSLog(@"[FAILED] %@", description);
	//NSAssert(condition, description);
}

-(int)assertions { return _assertions; }

@end
