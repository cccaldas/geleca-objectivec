/*
	AppDelegate.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/29/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import <UIKit/UIKit.h>
#import "TestAppViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
	TestAppViewController *vct_test;
}

@property (strong, nonatomic) UIWindow *window;

@end
