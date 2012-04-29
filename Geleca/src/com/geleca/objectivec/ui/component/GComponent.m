/*
 UIComponent.m
 Geleca
 
 Created by Cristiano Caldas on 2012-02-02.
 Copyright (c) 2012 Simbionte Studios. All rights reserved.
 */

#import "GComponent.h"
#import "ViewUtil.h"

//private
@interface GComponent()
-(void)updateRect;
@end

@implementation GComponent

@synthesize x = _x;
@synthesize y = _y;
@synthesize width 	= _width;
@synthesize height 	= _height;

-(id)init {
	self = [super init];
	
	if(self) {
		_x 		= self.frame.origin.x;
		_y 		= self.frame.origin.y;
		_width 	= self.frame.size.width;
		_height = self.frame.size.height;
		[self updateRect];
	}
	
	return self;
}

-(id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if(self) {
		_x 		= frame.origin.x;
		_y 		= frame.origin.y;
		_width 	= frame.size.width;
		_height = frame.size.height;
		
		[self setup];
	}
	
	return self;
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

-(void)setup {
	_dispatcher = [[EventDispatcher alloc] init];
}

-(void)updateRect {
	self.frame = CGRectMake(_x, _y, _width, _height);
}

-(void)move:(float)x y:(float)y {
	self.x = x;
	self.y = y;
}

-(void)setVisible:(BOOL)visible {
	self.hidden = !visible;
}

-(BOOL)visible { return !self.hidden; }

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

	[_dispatcher release];
	_dispatcher = nil;
	
	[super dealloc];
}

@end
