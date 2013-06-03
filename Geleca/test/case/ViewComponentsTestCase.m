//
//  ViewComponentsTestCase.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 6/12/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import "ViewComponentsTestCase.h"
#import "GView.h"

@interface ViewComponentsTestCase()
-(void)control_touchDown:(id)sender;
@end

@implementation ViewComponentsTestCase

-(void)setup {
	[super setup];
	
	UIButton *button	= [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.width		= 200;
	button.height		= 50;
	button.x = button.y = 100;
	[button setTitle:@"Button Label" forState:UIControlStateNormal];
	[self.view addSubview:button];
	
	//UIControl *control = [[UIControl alloc] init];
	UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
	[self.view addSubview:control];
	
	control.width = 200;
	control.height = 100;
	[control move:100 y:100];
	control.backgroundColor = [UIColor redColor];
	
	[control addTarget:self action:@selector(control_touchDown:) forControlEvents:UIControlEventTouchDown];
}

-(void)control_touchDown:(id)sender {
	NSLog(@"control_touchDown");
}

@end
