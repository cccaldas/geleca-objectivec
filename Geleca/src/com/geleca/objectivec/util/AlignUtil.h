/*
	AlignUtil.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/7/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import <Foundation/Foundation.h>

@interface AlignUtil : NSObject {
	
}

+(void)toLeft:(UIView *)target reference:(UIView *)reference;
+(void)toRight:(UIView *)target reference:(UIView *)reference;
+(void)toCenter:(UIView *)target reference:(UIView *)reference;
+(void)toMiddle:(UIView *)target reference:(UIView *)reference;
+(void)toCenterAndMiddle:(UIView *)target reference:(UIView *)reference;

@end
