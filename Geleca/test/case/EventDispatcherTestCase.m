//
//  EventDispatcherTestCase.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/29/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import "EventDispatcherTestCase.h"

@interface EventDispatcherTestCase()
-(void)event_complete:(Event *)e;
-(void)event_change:(Event *)e;
@end

@implementation EventDispatcherTestCase

-(void)setup {
	[super setup];
	
	//dispatcher
	dispatcher = [[EventDispatcher alloc] init];
	[dispatcher addEventListener:[Event COMPLETE] target:self listener:@selector(event_complete:)];
	[dispatcher addEventListener:[Event CHANGE] target:self listener:@selector(event_change:)];
	[dispatcher dispatchEvent:[Event withType:[Event COMPLETE]]];
	[dispatcher dispatchEvent:[Event withType:[Event CHANGE]]];
	[dispatcher removeEventListener:[Event COMPLETE] target:self listener:@selector(event_complete:)];
	[dispatcher removeEventListener:[Event CHANGE] target:self listener:@selector(event_change:)];	
	[dispatcher release];
	dispatcher = nil;
	
	//viewcontroller
	viewController = [[GViewController alloc] init];
	[viewController addEventListener:[Event COMPLETE] target:self listener:@selector(event_complete:)];
	[viewController addEventListener:[Event CHANGE] target:self listener:@selector(event_change:)];
	[viewController dispatchEvent:[Event withType:[Event COMPLETE]]];
	[viewController dispatchEvent:[Event withType:[Event CHANGE]]];
	[viewController dispatchEvent:[Event withType:[Event COMPLETE]]];
	[viewController dispatchEvent:[Event withType:[Event CHANGE]]];
	[viewController release];
	viewController = nil;
	
	//component
	component = [[GComponent alloc] init];
	[component addEventListener:[Event COMPLETE] target:self listener:@selector(event_complete:)];
	[component addEventListener:[Event CHANGE] target:self listener:@selector(event_change:)];
	[component dispatchEvent:[Event withType:[Event COMPLETE]]];
	[component dispatchEvent:[Event withType:[Event CHANGE]]];
	[component dispatchEvent:[Event withType:[Event COMPLETE]]];
	[component dispatchEvent:[Event withType:[Event CHANGE]]];
	[component release];
	component = nil;
	
	//label
	label = [[GLabel alloc] init];
	[label addEventListener:[Event COMPLETE] target:self listener:@selector(event_complete:)];
	[label addEventListener:[Event CHANGE] target:self listener:@selector(event_change:)];
	[label dispatchEvent:[Event withType:[Event COMPLETE]]];
	[label dispatchEvent:[Event withType:[Event CHANGE]]];
	[label dispatchEvent:[Event withType:[Event COMPLETE]]];
	[label dispatchEvent:[Event withType:[Event CHANGE]]];
	[label release];
	label = nil;
}

-(void)event_complete:(Event *)e {
	NSLog(@"EventDispatcherTestCase::event_complete()");
}

-(void)event_change:(Event *)e {
	NSLog(@"EventDispatcherTestCase::event_change()");	
}

@end
