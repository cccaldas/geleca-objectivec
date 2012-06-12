//
//  ComponentsSuite.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 6/12/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import "ComponentsSuite.h"
#import "ViewComponentsTestCase.h"

@implementation ComponentsSuite

-(void)setup {
	[super setup];
	
	[self addTestCase:[[ViewComponentsTestCase alloc] init]];
}

@end
