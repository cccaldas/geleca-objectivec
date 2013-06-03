/*
	LoadingSuite.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/29/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import "LoadingSuite.h"
#import "URLLoaderGetTestCase.h"
#import "URLLoaderPostTestCase.h"

@implementation LoadingSuite

-(void)setup {
	[super setup];
	
	[self addTestCase:[[URLLoaderGetTestCase alloc] init]];
	[self addTestCase:[[URLLoaderPostTestCase alloc] init]];
}

@end
