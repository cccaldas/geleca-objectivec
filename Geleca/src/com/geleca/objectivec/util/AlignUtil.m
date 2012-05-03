/*
	AlignUtil.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/7/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "AlignUtil.h"

@implementation AlignUtil

+(void)toCenter:(UIView *)target reference:(UIView *)reference {
	target.frame = CGRectMake(reference.frame.origin.x + ( (reference.frame.size.width - target.frame.size.width) * .5), 
							  target.frame.origin.y, 
							  target.frame.size.width, 
							  target.frame.size.height);
}

+(void)toMiddle:(UIView *)target reference:(UIView *)reference {
	target.frame = CGRectMake(target.frame.origin.x, 
							  reference.frame.origin.y + ( (reference.frame.size.height - target.frame.size.height) * .5), 
							  target.frame.size.width, 
							  target.frame.size.height);
}

+(void)toCenterAndMiddle:(UIView *)target reference:(UIView *)reference {
	[AlignUtil toCenter:target reference:reference];
	[AlignUtil toMiddle:target reference:reference];
}

@end