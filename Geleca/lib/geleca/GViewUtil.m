//
//  ViewUtil.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/19/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import "GViewUtil.h"

@implementation GViewUtil

+(void)removeAllSubviews:(UIView *)view {
	for (UIView *subView in view.subviews)
		[subView removeFromSuperview];
}


+(void)move:(UIView *)view x:(float)x y:(float)y {
	view.frame = CGRectMake(x, y, view.frame.size.width, view.frame.size.height);
}

+(void)move:(UIView *)view x:(float)x {
	[self move:view x:x y:view.frame.origin.y];
}

+(void)move:(UIView *)view y:(float)y {
	[self move:view x:view.frame.origin.x y:y];
}

+(void)resize:(UIView *)view width:(float)width height:(float)height {
	view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, width, height);
}

+(void)resize:(UIView *)view width:(float)width {
	[self resize:view width:width height:view.frame.size.height];
}

+(void)resize:(UIView *)view height:(float)height {
	[self resize:view width:view.frame.size.width height:height];
}

@end
