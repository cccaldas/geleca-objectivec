/*
	TestAppViewController.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/28/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "TestAppViewController.h"
#import "LoadingSuite.h"
#import "EventsSuite.h"
#import "UtilSuite.h"
#import "ComponentsSuite.h"

@interface TestAppViewController ()

@end

@implementation TestAppViewController

-(void)setup {
	[super setup];
	

	//[((EventsSuite *)[self addTestSuite:[[EventsSuite alloc] init]]) run];
	//[((LoadingSuite *)[self addTestSuite:[[LoadingSuite alloc] init]]) run];
	[[self addTestSuite:[[ComponentsSuite alloc] init]] run];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
