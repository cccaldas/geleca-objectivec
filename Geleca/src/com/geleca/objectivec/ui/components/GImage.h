/*
	GImage.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/1/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import "GComponent.h"

@interface GImage : UIImageView {
	
}

@property(nonatomic) float x, y, width, height;
@property(nonatomic) BOOL visible;

-(void)move:(float)x y:(float)y;
-(void)resize:(float)width height:(float)height;

@end
