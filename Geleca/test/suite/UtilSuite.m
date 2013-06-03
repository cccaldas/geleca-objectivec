//
//  UtilTestCase.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 6/9/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import "UtilSuite.h"

@implementation UtilSuite

-(void)setup {
	[super setup];
	
	[self addTestCase:[[DataUtilTestCase alloc] init]];
}

@end
