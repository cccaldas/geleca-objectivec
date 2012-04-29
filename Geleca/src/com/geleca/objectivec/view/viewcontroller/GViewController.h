/*
 GViewController.h
 Geleca
 
 Created by Cristiano Coutinho Caldas on 3/27/12.
 Copyright (c) 2012 Simbionte Studios. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "IEventDispatcher.h"
#import "EventDispatcher.h"

@interface GViewController : UIViewController <IEventDispatcher> {
	float _x, _y, _width, _height;
	EventDispatcher *_dispatcher;
}

@property(nonatomic) float x, y, width, height;
@property(nonatomic) BOOL visible;

-(void)move:(float)x y:(float)y;

-(void)setup;
-(id)initWithView:(UIView *)view;
-(void)addSubview:(UIView *)view;
@end
