/*
	GControl.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 6/21/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import "GControl.h"

@implementation GControl

-(id)init {
	self = [super init];
	//if(self)
		//[self setup];
	return self;
}

-(id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if(self)
		[self setup];
	
	return self;
}

-(void)setup {
	//NSLog(@"%@::setup()", self);
}

@end
