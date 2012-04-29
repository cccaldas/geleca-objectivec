/*
	GTestViewController.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/20/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "GTestViewController.h"

@interface GTestViewController ()

@end

@implementation GTestViewController

-(void)setup {
	[super setup];
	
	
}

-(id)addTestSuite:(GTestSuite *)suite {
	suite.view = self.view;
	
	return suite;
}

@end
