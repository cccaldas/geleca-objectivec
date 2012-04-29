/*
	GLoader.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/6/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "GLoader.h"
#import "ProgressEvent.h"

@interface GLoader()
-(void)run;
@end

@implementation GLoader

@synthesize isLoading = _isLoading;

-(id)init {
	self = [super init];
	
	if(self) {
		_items		= [NSMutableArray array];
		_current	= 0;
		_isLoading	= NO;
	}
	
	return self;
}

-(void)addLoadingItem:(GLoadingItem *)item {
	[_items addObject:item];
	//NSLog(@"GLoader::addLoadingItem() count:%d", [_items count]);
	
	[item addEventListener:[ProgressEvent PROGRESS] target:self listener:@selector(item_progress:)];
	[item addEventListener:[Event COMPLETE] target:self listener:@selector(item_complete:)];
}

-(void)item_progress:(ProgressEvent *)e {
	[self dispatchEvent:[ProgressEvent withType:[ProgressEvent PROGRESS] progress:self.progress]];
}

-(void)item_complete:(Event *)e {
	NSLog(@"GLoader:;item_complete() current:%d length:%d count:%d", _current, self.length, [_items count]);
	
	GLoadingItem *item = ((GLoadingItem *) e.target);
	[item removeEventListener:[ProgressEvent PROGRESS] target:self listener:@selector(item_progress:)];
	[item removeEventListener:[Event COMPLETE] target:self listener:@selector(item_complete:)];
	
	if(_current == self.length -1) {
		[self dispatchEvent:[Event withType:[Event COMPLETE]]];
		_current	= 0;
		_isLoading	= NO;
		return;
	}
	
	_current ++;
	[self run];
}

-(GLoadingItem *)getItem:(NSString *)id {
	for (GLoadingItem *item in _items) {
		if(item.id == id)
			return item;
	}
	
	return nil;
}

-(void)removeItem:(NSString *)id {
	if(self.length == 0)
		return;
	
	GLoadingItem *item = [self getItem:id];
	if(item == nil)
		return;
	
	[_items removeObject:item];
	
	//[item destroy];
	[item release];
	item = nil;
}

-(void)run {
	//NSLog(@"GLoader::run()");
	
	GLoadingItem *item = ((GLoadingItem *)[_items objectAtIndex:_current]);
	if(!item.loaded)
		[item load];
	else {
		_current ++;
		[self run];
	}
		
}

-(void)start {
	if(_isLoading)
		return;
	
	if(self.length == 0) {
		[self dispatchEvent:[Event withType:[Event COMPLETE]]];
		return;
	}
	
	_isLoading = YES;
	[self run];
}

-(void)pause {
	
}

-(void)stop {
	
}

-(void)cancel {
	
}

-(void)removeAll {
	for (GLoadingItem *item in _items) {
		[item release];
	}
	
	[_items removeAllObjects];
}

-(uint)length { return [_items count]; }

-(float)progress {
	
	float progress	= 0;
	float weight	= 0;
	
	for (GLoadingItem *item in _items) {
		progress	+= (item.progress / 1) * item.weight;
		weight		+= item.weight;
	}
	
	return progress / weight;
}

-(void)dealloc {
	[self removeAll];
	
	_items = nil;
	
	[super dealloc];
}

@end
