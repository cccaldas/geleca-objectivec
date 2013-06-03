/*
	GComponent.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 2012-02-02.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import <UIKit/UIKit.h>
#import "EventDispatcher.h"

@interface GComponent : UIControl <IEventDispatcher>
{
	float _x, _y, _width, _weight;
	EventDispatcher *_dispatcher;
}

@property(nonatomic) float x, y, width, height;
@property(nonatomic) BOOL visible;

-(void)setup;
-(void)move:(float)x y:(float)y;

@end