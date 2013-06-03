/*
	GView.h
	
	Created by Cristiano Coutinho Caldas on 6/19/11.
	Copyright 2011 Cristiano Coutinho Caldas. All rights reserved.
*/

#import "GViewUtil.h"

@interface UIView(Extension) {
	//EventDispatcher *_dispatcher;
}

@property(nonatomic) float x, y, width, height;
@property(nonatomic) BOOL visible;

-(void)move:(float)x y:(float)y;
-(void)resize:(float)width height:(float)height;

@end
