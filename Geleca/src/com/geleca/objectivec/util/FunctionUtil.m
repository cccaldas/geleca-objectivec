//
//  FunctionUtil.m
//
//  Created by Cristiano Caldas on 2012-02-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "FunctionUtil.h"

@implementation FunctionUtil

	+(void)functionDelay:(float)delay sender:(id)sender callBackSelector:(SEL)callBackSelector {
		[NSTimer scheduledTimerWithTimeInterval:delay target:sender selector:callBackSelector userInfo:nil repeats:NO];
	}
	
@end
