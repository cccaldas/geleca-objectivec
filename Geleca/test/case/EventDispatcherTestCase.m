//
//  EventDispatcherTestCase.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/29/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import "EventDispatcherTestCase.h"

@interface EventDispatcherTestCase()
-(void)dispatcher_complete:(Event *)e;
-(void)dispatcher_change:(Event *)e;
@end

@implementation EventDispatcherTestCase

-(void)setup {
	[super setup];
	
	dispatcher = [[EventDispatcher alloc] init];
	
	[dispatcher addEventListener:[Event COMPLETE] target:self listener:@selector(dispatcher_complete:)];
	[dispatcher addEventListener:[Event CHANGE] target:self listener:@selector(dispatcher_change:)];
	
	[dispatcher dispatchEvent:[Event withType:[Event COMPLETE]]];
	[dispatcher dispatchEvent:[Event withType:[Event CHANGE]]];
	
	[dispatcher removeEventListener:[Event COMPLETE] target:self listener:@selector(dispatcher_complete:)];
	[dispatcher removeEventListener:[Event CHANGE] target:self listener:@selector(dispatcher_change:)];
	
	[dispatcher dispatchEvent:[Event withType:[Event COMPLETE]]];
	[dispatcher dispatchEvent:[Event withType:[Event CHANGE]]];
	
	[dispatcher release];
	
}

-(void)dispatcher_complete:(Event *)e {
	NSLog(@"EventDispatcherTestCase::dispatcher_complete()");
}

-(void)dispatcher_change:(Event *)e {
	NSLog(@"EventDispatcherTestCase::dispatcher_change()");	
}

@end
