/*
	GLabel.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/29/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "GComponent.h"

@interface GLabel : GComponent {
	NSString	*_label;
	UILabel		*lbl_label;
}
@property(nonatomic, retain)			NSString *label;
@property(readonly, nonatomic, retain)	UILabel *lbl_label;
@property(nonatomic)					UITextAlignment textAlignment;

-(void)sizeToFit;

@end