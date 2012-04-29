//
//  EventDispatcherTestCase.h
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/29/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import "GTestCase.h"
#import "EventDispatcher.h"
#import "GViewController.h"
#import "GComponent.h"
#import "GLabel.h"

@interface EventDispatcherTestCase : GTestCase {
	EventDispatcher *dispatcher;
	GViewController *viewController;
	GComponent		*component;
	GLabel			*label;
}

@end
