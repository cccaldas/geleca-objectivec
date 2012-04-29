//
//  GTestSuite.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/20/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import "GTestSuite.h"

@interface GTestSuite()
-(void)testCase_complete:(Event *)e;
@end

@implementation GTestSuite
@synthesize view;

-(id)init {
	self = [super init];
	
	if(self) {
		//[self setup];
	}
	
	return self;
}

-(void)setup {
	_cases		= [[NSMutableArray array] retain];
	_current	= 0;
}

-(void)suiteComplete {
	NSLog(@"%@::suiteComplete(), assertions: %d", self, self.assertions);
}

-(void)addTestCase:(GTestCase *)testCase {
	//NSLog(@"TestSuite::addTestCase() %@", testCase);
	
	testCase.view = self.view;
	
	[testCase addEventListener:[Event COMPLETE] target:self listener:@selector(testCase_complete:)];
	[_cases addObject:testCase];
}

-(void)testCase_complete:(Event *)e {
	_current ++;
	
	[self run];
}

-(int)length { return [_cases count]; }

-(int)assertions {
	int _assertions = 0;
	
	for (GTestCase *testCase in _cases) {
		_assertions += testCase.assertions;
	}
	
	return _assertions;
}

-(void)run {
	if(_current == 0) {
		[self setup];
		NSLog(@"%@::run()", self);
	}
	
	if(_current == self.length) {
		_current = 0;
		[self suiteComplete];
		return;
	}
	
	GTestCase *test = [_cases objectAtIndex:_current];
	[test run];
}

@end
