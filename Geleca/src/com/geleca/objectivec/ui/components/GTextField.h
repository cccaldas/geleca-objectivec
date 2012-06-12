/*
	GTextField.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 6/12/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import <UIKit/UIKit.h>

@interface GTextField : UITextField {
	
}

@property(nonatomic) float x, y, width, height;
@property(nonatomic) BOOL visible;

-(void)move:(float)x y:(float)y;
-(void)resize:(float)width height:(float)height;

@end
