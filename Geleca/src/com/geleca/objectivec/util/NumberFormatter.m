/*
	NumberFormatter.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/1/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import "NumberFormatter.h"

@implementation NumberFormatter

+(NSString *)addLeadingZero:(int)number {
	if(number < 10)
		return [NSString stringWithFormat:@"0%d", number];
	
	return [NSString stringWithFormat:@"%d", number];
}

@end
