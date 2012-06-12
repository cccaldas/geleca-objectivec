//
//  ViewComponentsTestCase.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 6/12/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import "ViewComponentsTestCase.h"
#import "GImage.h"
#import "GLabel.h"
#import "GButton.h"

@interface ViewComponentsTestCase()
-(void)gImage;
-(void)gLabel;
-(void)gButton;
@end

@implementation ViewComponentsTestCase

-(void)setup {
	[super setup];
	
	//[self gImage];
	//[self gLabel];
	[self gButton];
}

-(void)gImage {
	NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://images.apple.com/home/images/macbookpro_hero.jpg"]];
	GImage *image = [[GImage alloc] initWithImage:[[UIImage imageWithData:data] init]];
	//GImage *image = [[GImage alloc] init];
	//GImage *image = [[GImage alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];	
	image.width		= 320;
	image.height	= 460;
	[self.view addSubview:image];
	
	[self testComplete];
}

-(void)gLabel {
	GLabel *label = [[GLabel alloc] init];
	
	label.text = @"Label Text";
	[label sizeToFit];
	
	[self.view addSubview:label];
	
	[self testComplete];	
}

-(void)gButton {
	GButton *button = [GButton buttonWithType:UIButtonTypeRoundedRect];
	[button setTitle:@"Text" forState:UIControlStateNormal];
	button.frame = CGRectMake(10, 10, 100, 40);
	[self.view addSubview:button];
	
	[self testComplete];
}

@end
