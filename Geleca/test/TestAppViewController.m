/*
	TestAppViewController.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/28/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import "TestAppViewController.h"

@interface TestAppViewController ()

@end

@implementation TestAppViewController
	//[((EventsSuite *)[self addTestSuite:[[EventsSuite alloc] init]]) run];
	//[((LoadingSuite *)[self addTestSuite:[[LoadingSuite alloc] init]]) run];
	//[[self addTestSuite:[[ComponentsSuite alloc] init]] run];

-(void)viewDidLoad {
	//[(LoadingSuite *)[[LoadingSuite alloc] init] run];
	[(AsyncSuite *)[[AsyncSuite alloc] init] run];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
