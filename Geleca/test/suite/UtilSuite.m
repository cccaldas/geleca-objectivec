//
//  UtilTestCase.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 6/9/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import "UtilSuite.h"
#import "DataUtilTestCase.h"

@implementation UtilSuite

-(void)setup {
	[super setup];
	
	[self addTestCase:[[DataUtilTestCase alloc] init]];
}

@end
