/*
	GLabel.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/29/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "GLabel.h"

@interface GLabel()
-(void)updateLabelSize;
@end

@implementation GLabel

@synthesize lbl_label;

-(void)setup {
	lbl_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	
	lbl_label.backgroundColor 	= [UIColor clearColor];
	lbl_label.font 				= [UIFont boldSystemFontOfSize:10];
	lbl_label.textColor 		= [UIColor blackColor];
	[self addSubview:lbl_label];
}

-(void)setLabel:(NSString *)value {
	_label = value;	
	lbl_label.text = _label;
	//[lbl_label sizeToFit];
}

-(NSString *)label { return _label; }

-(void)sizeToFit {
	[lbl_label sizeToFit];
}

-(void)setTextAlignment:(UITextAlignment)value {
	lbl_label.textAlignment = value;
}

-(void)setWidth:(float)width {
	[super setWidth:width];
	
	[self updateLabelSize];
}

-(void)setHeight:(float)height {
	[super setHeight:height];
	
	[self updateLabelSize];
}

-(UITextAlignment)textAlignment {
	return lbl_label.textAlignment;
}

-(void)updateLabelSize {
	lbl_label.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

-(void)dealloc {
	
	[super dealloc];
}

@end
