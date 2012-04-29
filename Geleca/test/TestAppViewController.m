/*
	TestAppViewController.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/28/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "TestAppViewController.h"

@interface TestAppViewController ()

@end

@implementation TestAppViewController

-(void)setup {
	[super setup];
	
	suite_loading	= [self addTestSuite:[[LoadingSuite alloc] init]];
	suite_events	= [self addTestSuite:[[EventsSuite alloc] init]];
	
	[suite_loading run];
	//[suite_events run];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
