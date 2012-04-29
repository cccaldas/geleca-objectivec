/*
	TestAppViewController.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/28/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "GTestViewController.h"
#import "LoadingSuite.h"
#import "EventsSuite.h"

@interface TestAppViewController : GTestViewController {
	LoadingSuite	*suite_loading;
	EventsSuite		*suite_events;
}

@end
