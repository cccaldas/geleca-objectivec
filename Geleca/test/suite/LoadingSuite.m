/*
	LoadingSuite.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/29/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "LoadingSuite.h"
#import "URLLoaderTestCase.h"

@implementation LoadingSuite

-(void)setup {
	[super setup];
	
	[self addTestCase:[[URLLoaderTestCase alloc] init]];
}

@end
