/*
	AlignUtil.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/7/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import "GAlignUtil.h"

@implementation GAlignUtil

+(void)toLeft:(UIView *)target reference:(UIView *)reference {
	target.frame = CGRectMake(reference.frame.origin.x, 
							  target.frame.origin.y, 
							  target.frame.size.width,
							  target.frame.size.height);
}

+(void)toRight:(UIView *)target reference:(UIView *)reference {
	target.frame = CGRectMake(reference.frame.origin.x + reference.frame.size.width - target.frame.size.width, 
							  target.frame.origin.y, 
							  target.frame.size.width,
							  target.frame.size.height);
}


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
	[GAlignUtil toCenter:target reference:reference];
	[GAlignUtil toMiddle:target reference:reference];
}

@end