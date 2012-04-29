//
//  EventsSuite.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/29/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import "EventsSuite.h"
#import "EventDispatcherTestCase.h"

@implementation EventsSuite

-(void)setup {
	[super setup];
	
	[self addTestCase:[[EventDispatcherTestCase alloc] init]];
}

@end
