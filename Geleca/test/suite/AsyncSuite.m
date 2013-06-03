//
//  AsyncSuite.m
//  Geleca
//
//  Created by Cristiano Caldas on 6/2/13.
//  Copyright (c) 2013 Cristiano Coutinho Caldas. All rights reserved.
//

#import "AsyncSuite.h"

@implementation AsyncSuite

-(void)setup {
	[super setup];
	
	[self addTestCase:[[AsyncLoaderTestCase alloc] init]];
}

@end
