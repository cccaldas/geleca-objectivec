//
//  ViewUtil.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/19/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import "ViewUtil.h"

@implementation ViewUtil

+(void)removeAllSubviews:(UIView *)view {
	for (UIView *subView in view.subviews)
		[subView removeFromSuperview];
}

@end
