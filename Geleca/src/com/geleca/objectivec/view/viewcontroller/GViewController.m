/*
 GViewController.m
 Geleca
 
 Created by Cristiano Coutinho Caldas on 3/27/12.
 Copyright (c) 2012 Simbionte Studios. All rights reserved.
 */

#import "GViewController.h"
#import "ViewUtil.h"
#import "IDestroyable.h"

@interface GViewController ()
-(void)updateRect;
@end

@implementation GViewController

@synthesize x		= _x;
@synthesize y		= _y;
@synthesize width 	= _width;
@synthesize height 	= _height;

-(void)setup {
	_dispatcher = [[EventDispatcher alloc] init];
}

-(id)init {
	self = [super init];
	
	if(self) {
		_x = _y = _width = _height = 0;
		[self updateRect];
		[self setup];
	}
	
	return self;
}

-(id)initWithView:(UIView *)view {
	self = [super init];
	if(self) {
		_x 		= view.frame.origin.x;
		_y 		= view.frame.origin.y;
		_width 	= view.frame.size.width;
		_height = view.frame.size.height;
		
		[self setup];
		self.view = view;
	}
	
	return self;
}

-(void)addSubview:(UIView *)view {
	[self.view addSubview:view];
}

-(void)setX:(float)value {
	_x = value;
	[self updateRect];
}

-(void)setY:(float)value {
	_y = value;
	[self updateRect];
}

-(void)setWidth:(float)value {
	_width = value;
	[self updateRect];
}

-(void)setHeight:(float)value {
	_height = value;
	[self updateRect];
}

-(void)updateRect {
	self.view.frame = CGRectMake(_x, _y, _width, _height);
}

-(void)move:(float)x y:(float)y {
	self.x = x;
	self.y = y;
}

-(void)setVisible:(BOOL)visible {
	self.view.hidden = !visible;
}

-(BOOL)visible { return !self.view.hidden; }

-(void)addEventListener:(NSString *)type target:(id)target listener:(SEL)listener {
	[_dispatcher addEventListener:type target:target listener:listener];
}

-(void)dispatchEvent:(Event *)event {
	//NSLog(@"GComponent::dispatchEvent()");
	event.target = self;
	[_dispatcher dispatchEvent:event];
}

-(void)removeEventListener:(NSString *)type target:(id)target listener:(SEL)listener {
	[_dispatcher removeEventListener:type target:target listener:listener];
}

-(BOOL)hasEventListener:(NSString *)type {
	return [_dispatcher hasEventListener:type];
}

-(void)removeAllListeners {
	[_dispatcher removeAllListeners];
}

-(void)dealloc {
	
	for (UIView *subView in self.view.subviews) {
		[subView removeFromSuperview];
		//if([subView conformsToProtocol:@protocol(IDestroyable)])
			//[((id<IDestroyable>)subView) destroy];
		[subView release];
	}
	
	[self.view removeFromSuperview];
	
	self.view = nil;
	
	[_dispatcher release];
	_dispatcher = nil;
	
	[super dealloc];
}

@end
