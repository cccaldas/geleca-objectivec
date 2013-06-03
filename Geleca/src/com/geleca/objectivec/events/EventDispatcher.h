/*
 EventDispatcher.h
 Geleca
 
 Created by Cristiano Coutinho Caldas on 4/6/12.
 Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "IEventDispatcher.h"
#import "IDestroyable.h"

@interface EventDispatcher : NSObject <IEventDispatcher> {
	NSMutableDictionary *_listeners;
}

@end
