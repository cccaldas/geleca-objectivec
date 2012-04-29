/*
 EventDispatcher.m
 Geleca
 
 Created by Cristiano Coutinho Caldas on 4/6/12.
 Copyright (c) 2012 Simbionte Studios. All rights reserved.
 */

#import "EventDispatcher.h"
#import "EventHandler.h"

@implementation EventDispatcher

-(id)init {
	if((self = [super init])){
		_listeners = [NSMutableDictionary dictionary];
		[_listeners retain];
	}
	
	return self;
}

-(void)addEventListener:(NSString *)type target:(id)target listener:(SEL)listener {
	if([_listeners objectForKey:type] == nil)
		[_listeners setObject:[NSMutableArray array] forKey:type];
	
	NSMutableArray *array = [_listeners objectForKey:type];
	[array addObject:[[EventHandler alloc] initWithObject:target method:listener]]; 
}

-(void)removeEventListener:(NSString *)type target:(id)target listener:(SEL)listener {		
	if([_listeners objectForKey:type] == nil)
		return;
	
	NSMutableArray *array = [_listeners objectForKey:type];
	//NSLog(@"EventDispatcher::removeEventListener() listeners: %d", [array count]);
	
	for (EventHandler *handler in array) {
		if(handler.obj == target && handler.method == listener) {
			[array removeObject:handler];
			[handler release];
			if([array count] == 0) {
				[_listeners removeObjectForKey:type];
				//[array release];
			}
			return;
		}
	}
}

-(void)dispatchEvent:(Event *)event {
	//NSLog(@"EventDispatcher::dispatchEvent() _listeners: %@", _listeners);
	
	if([_listeners count] == 0)
		return;
	
	if([_listeners objectForKey:event.type] == nil)
		return;
	
	if(event.target == nil)
		event.target = self;
	
	NSArray *array = [_listeners objectForKey:event.type];
	
	//NSLog(@"EventDispatcher::dispatchEvent() _listeners: %@", array);
	
	for (EventHandler *handler in array) {
		[handler.obj performSelector:handler.method withObject:event];
	}
}

-(BOOL)hasEventListener:(NSString *)type {
	return [_listeners objectForKey:type] != nil;
}

-(void)removeAllListeners {
	//NSLog(@"EventDispatcher::removeAllListeners()");
	NSMutableArray	*listeners;
	for (NSString *key in _listeners) {
		listeners = [_listeners objectForKey:key];
		for (EventHandler *handler in listeners) {
			[handler release];
			//[self removeEventListener:key target:handler.obj listener:handler.method];
		}
	}
	
	[_listeners removeAllObjects];
}

-(void)dealloc {
	[self removeAllListeners];
	[_listeners release];
	_listeners = nil;
	
	[super dealloc];
}

@end
