//
//  GTestSuite.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/20/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import "GTestSuite.h"

@interface GTestSuite()

@end

@implementation GTestSuite

-(id)init {
	self = [super init];
	
	if(self) {
		//[self setup];
	}
	
	return self;
}

-(void)setup {
	_cases		= [NSMutableArray array];
	_current	= 0;
}

-(void)suiteComplete {
	NSLog(@"%@::suiteComplete(), assertions: %d", self, self.assertions);
}

-(void)addTestCase:(GTestCase *)testCase {
	//NSLog(@"TestSuite::addTestCase() %@", testCase);
	
	//testCase.view = self.view;
	testCase.delegate = self;
	
	//[testCase addEventListener:[Event COMPLETE] target:self listener:@selector(testCase_complete:)];
	[_cases addObject:testCase];
}

-(void)testCaseComplete:(id)testCase {
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
