/*
	GLoader.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/6/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import <UIKit/UIKit.h>
#import "GLoadingItem.h"
#import "EventDispatcher.h"

@interface GLoader : EventDispatcher {
	NSMutableArray *_items;
	int				_current;
	BOOL			_isLoading;
}

@property (nonatomic, readonly) uint length;
@property (nonatomic, readonly) float progress;
@property (nonatomic, readonly) BOOL isLoading;

-(void)addLoadingItem:(GLoadingItem *)item;
-(GLoadingItem *)getItem:(NSString *)id;

-(void)removeItem:(NSString *)id;
-(void)start;
-(void)pause;
-(void)stop;
-(void)cancel;
-(void)removeAll;

@end
