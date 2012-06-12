//
//  ViewUtil.h
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/19/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewUtil : NSObject {
	
}

+(void)removeAllSubviews:(UIView *)view;


+(void)move:(UIView *)view x:(float)x y:(float)y;
+(void)move:(UIView *)view x:(float)x;
+(void)move:(UIView *)view y:(float)y;

+(void)resize:(UIView *)view width:(float)width height:(float)height;
+(void)resize:(UIView *)view width:(float)width;
+(void)resize:(UIView *)view height:(float)height;

@end
