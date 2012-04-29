/*
	IEventDispatcher.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/6/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import <Foundation/Foundation.h>
#import "Event.h"

@protocol IEventDispatcher <NSObject>

-(void)addEventListener:(NSString *)type target:(id)target listener:(SEL)listener;
-(void)removeEventListener:(NSString *)type target:(id)target listener:(SEL)listener;
-(void)removeAllListeners;
-(void)dispatchEvent:(Event *)event;
-(BOOL)hasEventListener:(NSString *)type;

@end
